import 'dart:math';
import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/data/course_model.dart';
import '../../../core/data/schedule_model.dart';

class CourseDataSource extends CalendarDataSource {
  /// Creates a data source for a single schedule.
  CourseDataSource(ScheduleModel schedule) {
    appointments = _convertScheduleToAppointments(schedule);
  }

  /// Internal helper to convert a schedule's courses into a list of appointments.
  List<Appointment> _convertScheduleToAppointments(ScheduleModel schedule) {
    final List<Appointment> appointmentList = [];
    final Random random = Random();
    final DateTime today = DateTime.now();

    // Find the date of the most recent Sunday to use as the anchor
    // for this week. (DateTime.weekday: 1=Mon, 7=Sun)
    // (today.weekday % 7) gives 0 for Sun, 1 for Mon, ..., 6 for Sat.
    final DateTime startOfWeek = today.subtract(Duration(days: today.weekday % 7));

    for (final CourseModel course in schedule.courses) {
      // Generate a consistent random color for each course
      final Color courseColor = Color.fromRGBO(
        random.nextInt(200) + 55, // Avoid very dark colors
        random.nextInt(200) + 55,
        random.nextInt(200) + 55,
        1.0,
      );

      for (final TimeSlot slot in course.timings) {
        // Map our abstract DayOfWeek enum to a concrete DateTime this week
        final DateTime date = _getDateTimeForDay(startOfWeek, slot.day);

        final DateTime startTime = DateTime(
          date.year,
          date.month,
          date.day,
          slot.startTime.hour,
          slot.startTime.minute,
        );

        final DateTime endTime = DateTime(
          date.year,
          date.month,
          date.day,
          slot.endTime.hour,
          slot.endTime.minute,
        );

        appointmentList.add(Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: "${course.name}\n(${course.code})",
          color: courseColor,
          // You can add more data here if needed
          // e.g., notes: 'Credit Hours: ${course.creditHours}'
        ));
      }
    }
    return appointmentList;
  }

  /// Helper to get the concrete [DateTime] for a given [DayOfWeek]
  /// based on the [startOfWeek] (which is assumed to be a Sunday).
  DateTime _getDateTimeForDay(DateTime startOfWeek, DayOfWeek day) {
    int daysToAdd = 0;
    switch (day) {
      case DayOfWeek.sunday:
        daysToAdd = 0;
        break;
      case DayOfWeek.monday:
        daysToAdd = 1;
        break;
      case DayOfWeek.tuesday:
        daysToAdd = 2;
        break;
      case DayOfWeek.wednesday:
        daysToAdd = 3;
        break;
      case DayOfWeek.thursday:
        daysToAdd = 4;
        break;
      case DayOfWeek.friday:
        daysToAdd = 5;
        break;
      case DayOfWeek.saturday:
        daysToAdd = 6;
        break;
    }
    return startOfWeek.add(Duration(days: daysToAdd));
  }
}
