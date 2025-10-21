import 'course_model.dart';
import 'package:uuid/uuid.dart';

class ScheduleModel {
  final String id;
  final List<CourseModel> courses;

  ScheduleModel({
    required this.courses,
  }) : id = const Uuid().v4(); // Generate a unique ID for each schedule instance.

  int get totalCreditHours {
    return courses.fold(0, (sum, course) => sum + course.creditHours);
  }
}
