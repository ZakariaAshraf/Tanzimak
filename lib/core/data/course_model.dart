import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// An enum for type-safety and clarity when dealing with days of the week.
enum DayOfWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

class TimeSlot {
  final DayOfWeek day;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimeSlot({required this.day, required this.startTime, required this.endTime});
  @override
  String toString() {
    return "${day.name.trim()} ${startTime.hour}-${endTime.hour}";
  }
}

class CourseModel {
  final String id;
  final String name;
  final String code;
  final int creditHours;
  final List<TimeSlot> timings;

  CourseModel({
    required this.name,
    required this.code,
    required this.creditHours,
    required this.timings,
  }) : id = const Uuid().v4();

  // static List<CourseModel> getMockCourses() {
  //   return [
  //     CourseModel(
  //       name: 'Data Structures',
  //       code: 'CS210',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.sunday, startTime: const TimeOfDay(hour: 10, minute: 0), endTime: const TimeOfDay(hour: 12, minute: 0)),
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Databases I',
  //       code: 'IS301',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.monday, startTime: const TimeOfDay(hour: 12, minute: 0), endTime: const TimeOfDay(hour: 14, minute: 0)),
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Calculus III',
  //       code: 'MA203',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.tuesday, startTime: const TimeOfDay(hour: 14, minute: 0), endTime: const TimeOfDay(hour: 16, minute: 0)),
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Software Engineering',
  //       code: 'CS305',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.wednesday, startTime: const TimeOfDay(hour: 10, minute: 0), endTime: const TimeOfDay(hour: 12, minute: 0)),
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Physics II',
  //       code: 'PH102',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.sunday, startTime: const TimeOfDay(hour: 11, minute: 0), endTime: const TimeOfDay(hour: 13, minute: 0)), // تتعارض
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Operations Research',
  //       code: 'OR301',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.monday, startTime: const TimeOfDay(hour: 13, minute: 0), endTime: const TimeOfDay(hour: 15, minute: 0)), // تتعارض
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Economics',
  //       code: 'EC101',
  //       creditHours: 2,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.thursday, startTime: const TimeOfDay(hour: 14, minute: 0), endTime: const TimeOfDay(hour: 16, minute: 0)),
  //       ],
  //     ),
  //     CourseModel(
  //       name: 'Statistics',
  //       code: 'ST202',
  //       creditHours: 3,
  //       timings: [
  //         TimeSlot(day: DayOfWeek.monday, startTime: const TimeOfDay(hour: 16, minute: 0), endTime: const TimeOfDay(hour: 18, minute: 0)),
  //       ],
  //     ),
  //   ];
  // }
}
