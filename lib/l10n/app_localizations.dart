import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @tanzimak.
  ///
  /// In en, this message translates to:
  /// **'Tanzimak'**
  String get tanzimak;

  /// No description provided for @buildYourPerfectSchedule.
  ///
  /// In en, this message translates to:
  /// **'Build your perfect university schedule without the stress.'**
  String get buildYourPerfectSchedule;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @addCourses.
  ///
  /// In en, this message translates to:
  /// **'Add Courses'**
  String get addCourses;

  /// No description provided for @addCoursesDescription.
  ///
  /// In en, this message translates to:
  /// **'[+] Add all the courses available to you this semester. We will find the best combinations for you.'**
  String get addCoursesDescription;

  /// No description provided for @addNewCourse.
  ///
  /// In en, this message translates to:
  /// **'[+] ADD NEW COURSE'**
  String get addNewCourse;

  /// No description provided for @generateSchedulesWithoutNumber.
  ///
  /// In en, this message translates to:
  /// **'GENERATE SCHEDULES'**
  String get generateSchedulesWithoutNumber;

  /// No description provided for @generatingScheduleSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Generating Schedule Suggestions'**
  String get generatingScheduleSuggestions;

  /// No description provided for @generateSchedules.
  ///
  /// In en, this message translates to:
  /// **'GENERATE SCHEDULES ({count})'**
  String generateSchedules(int count);

  /// No description provided for @addCourse.
  ///
  /// In en, this message translates to:
  /// **'Add Course'**
  String get addCourse;

  /// No description provided for @courseName.
  ///
  /// In en, this message translates to:
  /// **'Course Name'**
  String get courseName;

  /// No description provided for @courseNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Introduction to Programming'**
  String get courseNameHint;

  /// No description provided for @courseCode.
  ///
  /// In en, this message translates to:
  /// **'Course Code'**
  String get courseCode;

  /// No description provided for @courseCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. CS101'**
  String get courseCodeHint;

  /// No description provided for @courseHours.
  ///
  /// In en, this message translates to:
  /// **'Course Hours'**
  String get courseHours;

  /// No description provided for @courseHoursHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 3'**
  String get courseHoursHint;

  /// No description provided for @courseTimings.
  ///
  /// In en, this message translates to:
  /// **'Course Timings'**
  String get courseTimings;

  /// No description provided for @addAnotherTiming.
  ///
  /// In en, this message translates to:
  /// **'Add another Timing'**
  String get addAnotherTiming;

  /// No description provided for @saveCourse.
  ///
  /// In en, this message translates to:
  /// **'Save Course'**
  String get saveCourse;

  /// No description provided for @pleaseAddTiming.
  ///
  /// In en, this message translates to:
  /// **'Please add at least one course timing.'**
  String get pleaseAddTiming;

  /// No description provided for @pleaseEnterValidHours.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number for course hours.'**
  String get pleaseEnterValidHours;

  /// No description provided for @dayOfTheWeek.
  ///
  /// In en, this message translates to:
  /// **'Day of the Week'**
  String get dayOfTheWeek;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @saveSchedule.
  ///
  /// In en, this message translates to:
  /// **'Save Schedule'**
  String get saveSchedule;

  /// No description provided for @endTimeMustBeAfterStart.
  ///
  /// In en, this message translates to:
  /// **'End time must be after start time.'**
  String get endTimeMustBeAfterStart;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hrs'**
  String get hours;

  /// No description provided for @schedulePreferences.
  ///
  /// In en, this message translates to:
  /// **'Schedule Preferences'**
  String get schedulePreferences;

  /// No description provided for @desiredCreditHoursRange.
  ///
  /// In en, this message translates to:
  /// **'Desired Credit Hours Range'**
  String get desiredCreditHoursRange;

  /// No description provided for @hoursRange.
  ///
  /// In en, this message translates to:
  /// **'{start} - {end} hours'**
  String hoursRange(int start, int end);

  /// No description provided for @preferredDaysOff.
  ///
  /// In en, this message translates to:
  /// **'Preferred Days Off'**
  String get preferredDaysOff;

  /// No description provided for @choosePreferredDaysOff.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred days off.'**
  String get choosePreferredDaysOff;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @suggestedSchedules.
  ///
  /// In en, this message translates to:
  /// **'Suggested Schedules'**
  String get suggestedSchedules;

  /// No description provided for @scheduleOf.
  ///
  /// In en, this message translates to:
  /// **'Schedule {current} of {total}'**
  String scheduleOf(int current, int total);

  /// No description provided for @totalCredits.
  ///
  /// In en, this message translates to:
  /// **'Total Credits: {credits}'**
  String totalCredits(int credits);

  /// No description provided for @noSchedulesToDisplay.
  ///
  /// In en, this message translates to:
  /// **'No schedules to display.'**
  String get noSchedulesToDisplay;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
