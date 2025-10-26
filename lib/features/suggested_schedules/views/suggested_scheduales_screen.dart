import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tanzimak/core/config/screen_util.dart';
import '../../../core/data/schedule_model.dart';
import '../widgets/course_data_source.dart';
import '../../../l10n/app_localizations.dart';

class SuggestedSchedulesScreen extends StatefulWidget {
  final List<ScheduleModel> schedules;

  const SuggestedSchedulesScreen({super.key, required this.schedules});

  @override
  State<SuggestedSchedulesScreen> createState() =>
      _SuggestedSchedulesScreenState();
}

class _SuggestedSchedulesScreenState extends State<SuggestedSchedulesScreen> {
  int _currentIndex = 0;
  late List<CourseDataSource> _dataSources;
  final PageController _pageController = PageController();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _dataSources = widget.schedules
        .map((schedule) => CourseDataSource(schedule))
        .toList();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (widget.schedules.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.suggestedSchedules)),
        body: Center(child: Text(l10n.noSchedulesToDisplay)),
      );
    }
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.suggestedSchedules)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(l10n.generatingScheduleSuggestions),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.scheduleOf(_currentIndex + 1, widget.schedules.length),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _dataSources.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _currentIndex == 0
                                ? null
                                : () {
                              _pageController.previousPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: _currentIndex == 0
                                  ? Colors.grey.withOpacity(0.5)
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              l10n.totalCredits(widget.schedules[_currentIndex].totalCreditHours),
                              style: Theme.of(context)
                                  .appBarTheme
                                  .titleTextStyle
                                  ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed:
                            _currentIndex == _dataSources.length - 1
                                ? null
                                : () {
                              _pageController.nextPage(
                                duration: const Duration(
                                    milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color:
                              _currentIndex == _dataSources.length - 1
                                  ? Colors.grey.withOpacity(0.5)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SfCalendar(
                        allowViewNavigation: true,
                        showCurrentTimeIndicator: false,
                        showTodayButton: false,
                        showNavigationArrow: false,
                        view: CalendarView.week,
                        dataSource: _dataSources[index],
                        firstDayOfWeek: 7,
                        timeSlotViewSettings: const TimeSlotViewSettings(
                          startHour: 8,
                          endHour: 22,
                          timeFormat: 'h:mm a',
                        ),
                        appointmentBuilder:
                            (context, calendarAppointmentDetails) {
                          final Appointment appointment =
                              calendarAppointmentDetails.appointments.first;
                          return Container(
                            decoration: BoxDecoration(
                              color: appointment.color,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              appointment.subject,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (widget.schedules.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.schedules.length, (index) {
                return Expanded(
                  child: Container(
                    width: 9.0.w(context),
                    height: 9.0.h(context),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}