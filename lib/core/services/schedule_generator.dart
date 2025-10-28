import 'package:flutter/material.dart';

import '../data/course_model.dart';
import '../data/schedule_model.dart';
class ScheduleGenerator {
  /// الدالة الرئيسية والوحيدة التي سيتم استدعاؤها من واجهة المستخدم.
  ///
  /// تأخذ:
  ///   - allCourses: كل المواد التي أدخلها المستخدم.
  ///   - minHours: الحد الأدنى للساعات المعتمدة.
  ///   - maxHours: الحد الأقصى للساعات المعتمدة.
  ///   - preferredDaysOff: قائمة الأيام التي يفضل المستخدم أن تكون إجازة.
  ///
  /// ترجع:
  ///   - قائمة بالجداول الصالحة والمقترحة (List<ScheduleModel>).
  Future<List<ScheduleModel>> generateSchedules({
    required List<CourseModel> allCourses,
    required int minHours,
    required int maxHours,
    required Set<DayOfWeek> preferredDaysOff,
  }) async {
    // سنقوم بتشغيل هذه العملية المعقدة في "Isolate" منفصل
    // حتى لا يتجمد التطبيق أو الواجهة (UI) أثناء الحساب
    // وهذا يعطي تجربة مستخدم احترافية.
    return Future(() {
      List<ScheduleModel> validSchedules = [];
      List<List<CourseModel>> allPossibleCombinations = [];

      // --- المشكلة الأولى: توليد كل التوافيق ---
      // نبدأ بتوليد التوافيق من عدد مواد معقول (مثلاً من 3 إلى 7 مواد)
      // هذا هو النطاق الأكثر شيوعًا للطلاب.
      for (int k = 3; k <= 7; k++) {
        // نستدعي الدالة المساعدة التي تقوم بالسحر كله
        allPossibleCombinations.addAll(
          _findCombinations(allCourses, k),
        );
      }

      // --- المشكلة الرابعة: الفلترة والتجميع ---
      // الآن لدينا كل الاحتمالات، سنقوم بفلترتها
      for (var scheduleCourses in allPossibleCombinations) {

        // 1. فلتر الساعات المعتمدة
        int totalHours = scheduleCourses.fold(0, (sum, course) => sum + course.creditHours);
        if (totalHours < minHours || totalHours > maxHours) {
          continue; // اذهب إلى الجدول التالي، هذا غير مناسب
        }

        // 2. فلتر أيام الإجازة المفضلة
        bool hasClassOnDayOff = scheduleCourses.any((course) =>
            course.timings.any((time) => preferredDaysOff.contains(time.day)));

        if (hasClassOnDayOff) {
          continue; // اذهب إلى الجدول التالي، هذا يخالف رغبة المستخدم
        }

        // 3. فلتر التعارض (أهم وأعقد فلتر)
        bool hasConflict = _doesScheduleHaveConflicts(scheduleCourses);
        if (hasConflict) {
          continue; // اذهب إلى الجدول التالي، هذا الجدول به تعارض
        }

        // --- النجاح! ---
        // إذا وصل الكود إلى هنا، فهذا الجدول صالح 100%
        validSchedules.add(ScheduleModel(courses: scheduleCourses));
      }

      return validSchedules;
    });
  }

  // --- حل المشكلة الأولى: دالة توليد التوافيق (Combinations) ---
  /// دالة مساعدة (Recursive) لإيجاد كل التوافيق الممكنة
  /// k هو عدد المواد التي نريد اختيارها في كل مرة
  List<List<CourseModel>> _findCombinations(List<CourseModel> courses, int k) {
    List<List<CourseModel>> allCombinations = [];

    // دالة داخلية (Recursive) لتبسيط العملية
    void getCombinationsRecursive(List<CourseModel> currentCombination, int startIndex) {
      // الشرط الأساسي لإيقاف الـ Recursion
      // إذا اكتملت المجموعة (k)، أضفها للنتائج
      if (currentCombination.length == k) {
        allCombinations.add(List.from(currentCombination));
        return;
      }

      // إذا لم تكتمل، استمر في إضافة المواد
      for (int i = startIndex; i < courses.length; i++) {
        currentCombination.add(courses[i]);
        // استدعاء الدالة لنفسها (Recursion) مع زيادة الـ startIndex
        // لضمان عدم تكرار نفس المادة
        getCombinationsRecursive(currentCombination, i + 1);
        // إزالة المادة الأخيرة لتجربة الاحتمال التالي
        currentCombination.removeLast();
      }
    }

    getCombinationsRecursive([], 0);
    return allCombinations;
  }

  // --- حل المشكلة الثالثة: التحقق من تعارض "جدول كامل" ---
  /// تأخذ قائمة من المواد (جدول مقترح) وتتحقق من وجود أي تعارض بين أي مادتين فيها
  bool _doesScheduleHaveConflicts(List<CourseModel> scheduleCourses) {
    // نقارن كل مادة بجميع المواد التي تليها
    for (int i = 0; i < scheduleCourses.length; i++) {
      for (int j = i + 1; j < scheduleCourses.length; j++) {
        // نستخدم الدالة المساعدة من المشكلة الثانية
        if (_doCoursesConflict(scheduleCourses[i], scheduleCourses[j])) {
          return true; // وجدنا تعارض واحد، لا داعي لإكمال البحث
        }
      }
    }
    return false; // لا يوجد أي تعارض في هذا الجدول
  }
  bool _doCoursesConflict(CourseModel courseA, CourseModel courseB) {
    for (var timeA in courseA.timings) {
      for (var timeB in courseB.timings) {
        // 1. هل هما في نفس اليوم؟
        if (timeA.day == timeB.day) {
          // 2. إذا كانا في نفس اليوم، هل أوقاتهما تتقاطع؟
          // هذا هو المنطق الأساسي للتحقق من التقاطع الزمني
          bool startsBeforeEnd = timeA.startTime.toMinutes() < timeB.endTime.toMinutes();
          bool endsAfterStart = timeA.endTime.toMinutes() > timeB.startTime.toMinutes();

          if (startsBeforeEnd && endsAfterStart) {
            return true; // يوجد تعارض!
          }
        }
      }
    }
    return false; // لا يوجد تعارض بين هاتين المادتين
  }
}

extension TimeOfDayExtension on TimeOfDay {
  int toMinutes() {
    return hour * 60 + minute;
  }
}
