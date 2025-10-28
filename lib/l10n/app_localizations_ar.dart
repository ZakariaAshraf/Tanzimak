// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get tanzimak => 'تنظيمك';

  @override
  String get buildYourPerfectSchedule => 'قم ببناء جدولك الجامعي المثالي دون ضغط.';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get addCourses => 'إضافة المواد';

  @override
  String get addCoursesDescription => '[+] أضف جميع المواد المتاحة لك هذا الفصل. سنجد لك أفضل التركيبات.';

  @override
  String get addNewCourse => '[+] إضافة مادة جديدة';

  @override
  String get generateSchedulesWithoutNumber => 'إنشاء الجداول';

  @override
  String get generatingScheduleSuggestions => ' جاري تحميل الجداول المقترحه ';

  @override
  String generateSchedules(int count) {
    return 'إنشاء الجداول ($count)';
  }

  @override
  String get addCourse => 'إضافة مادة';

  @override
  String get courseName => 'اسم المادة';

  @override
  String get courseNameHint => 'مثال: مقدمة في البرمجة';

  @override
  String get courseCode => 'رمز المادة';

  @override
  String get courseCodeHint => 'مثال: CS101';

  @override
  String get courseHours => 'ساعات المادة';

  @override
  String get courseHoursHint => 'مثال: 3';

  @override
  String get courseTimings => 'أوقات المادة';

  @override
  String get addAnotherTiming => 'إضافة وقت آخر';

  @override
  String get saveCourse => 'حفظ المادة';

  @override
  String get pleaseAddTiming => 'يرجى إضافة وقت واحد على الأقل للمادة.';

  @override
  String get pleaseEnterValidHours => 'يرجى إدخال رقم صحيح لساعات المادة.';

  @override
  String get dayOfTheWeek => 'يوم الأسبوع';

  @override
  String get startTime => 'وقت البداية';

  @override
  String get endTime => 'وقت النهاية';

  @override
  String get saveSchedule => 'حفظ الجدول';

  @override
  String get endTimeMustBeAfterStart => 'يجب أن يكون وقت النهاية بعد وقت البداية.';

  @override
  String get hours => 'ساعات';

  @override
  String get schedulePreferences => 'تفضيلات الجدول';

  @override
  String get desiredCreditHoursRange => 'نطاق الساعات المطلوبة';

  @override
  String hoursRange(int start, int end) {
    return '$start - $end ساعة';
  }

  @override
  String get preferredDaysOff => 'الأيام المفضلة للإجازة';

  @override
  String get choosePreferredDaysOff => 'اختر أيام الإجازة المفضلة لديك.';

  @override
  String get monday => 'الاثنين';

  @override
  String get tuesday => 'الثلاثاء';

  @override
  String get wednesday => 'الأربعاء';

  @override
  String get thursday => 'الخميس';

  @override
  String get friday => 'الجمعة';

  @override
  String get saturday => 'السبت';

  @override
  String get sunday => 'الأحد';

  @override
  String get suggestedSchedules => 'الجداول المقترحة';

  @override
  String scheduleOf(int current, int total) {
    return 'الجدول $current من $total';
  }

  @override
  String totalCredits(int credits) {
    return 'إجمالي الساعات: $credits';
  }

  @override
  String get noSchedulesToDisplay => 'لا توجد جداول للعرض.';
}
