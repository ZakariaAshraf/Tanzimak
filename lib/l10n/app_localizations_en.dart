// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tanzimak => 'Tanzimak';

  @override
  String get buildYourPerfectSchedule => 'Build your perfect university schedule without the stress.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get addCourses => 'Add Courses';

  @override
  String get addCoursesDescription => '[+] Add all the courses available to you this semester. We will find the best combinations for you.';

  @override
  String get addNewCourse => '[+] ADD NEW COURSE';

  @override
  String get generateSchedulesWithoutNumber => 'GENERATE SCHEDULES';

  @override
  String get generatingScheduleSuggestions => 'Generating Schedule Suggestions';

  @override
  String generateSchedules(int count) {
    return 'GENERATE SCHEDULES ($count)';
  }

  @override
  String get addCourse => 'Add Course';

  @override
  String get courseName => 'Course Name';

  @override
  String get courseNameHint => 'e.g. Introduction to Programming';

  @override
  String get courseCode => 'Course Code';

  @override
  String get courseCodeHint => 'e.g. CS101';

  @override
  String get courseHours => 'Course Hours';

  @override
  String get courseHoursHint => 'e.g. 3';

  @override
  String get courseTimings => 'Course Timings';

  @override
  String get addAnotherTiming => 'Add another Timing';

  @override
  String get saveCourse => 'Save Course';

  @override
  String get pleaseAddTiming => 'Please add at least one course timing.';

  @override
  String get pleaseEnterValidHours => 'Please enter a valid number for course hours.';

  @override
  String get dayOfTheWeek => 'Day of the Week';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get saveSchedule => 'Save Schedule';

  @override
  String get endTimeMustBeAfterStart => 'End time must be after start time.';

  @override
  String get hours => 'hrs';

  @override
  String get schedulePreferences => 'Schedule Preferences';

  @override
  String get desiredCreditHoursRange => 'Desired Credit Hours Range';

  @override
  String hoursRange(int start, int end) {
    return '$start - $end hours';
  }

  @override
  String get preferredDaysOff => 'Preferred Days Off';

  @override
  String get choosePreferredDaysOff => 'Choose your preferred days off.';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get suggestedSchedules => 'Suggested Schedules';

  @override
  String scheduleOf(int current, int total) {
    return 'Schedule $current of $total';
  }

  @override
  String totalCredits(int credits) {
    return 'Total Credits: $credits';
  }

  @override
  String get noSchedulesToDisplay => 'No schedules to display.';
}
