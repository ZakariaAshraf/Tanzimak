import 'package:flutter/material.dart';
import 'package:tanzimak/core/data/course_model.dart';
import 'package:tanzimak/core/data/schedule_model.dart';
import 'package:tanzimak/core/services/schedule_generator.dart';

import '../../../widgets/primary_button.dart';
import '../../suggested_schedules/views/suggested_scheduales_screen.dart';

class SetYourPreferencesScreen extends StatefulWidget {
  final List<CourseModel> courses;

  const SetYourPreferencesScreen({super.key, required this.courses});

  @override
  State<SetYourPreferencesScreen> createState() =>
      _SetYourPreferencesScreenState();
}

class _SetYourPreferencesScreenState extends State<SetYourPreferencesScreen> {
  RangeValues _creditHours = const RangeValues(12, 18);

  final Map<DayOfWeek, bool> _daysOff = {
    DayOfWeek.saturday: false,
    DayOfWeek.sunday: false,
    DayOfWeek.monday: false,
    DayOfWeek.tuesday: false,
    DayOfWeek.wednesday: false,
    DayOfWeek.thursday: false,
    DayOfWeek.friday: false,
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Preferences", style: theme.titleLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Desired Credit Hours Range", style: theme.titleMedium),
            const SizedBox(height: 8),

            RangeSlider(
              values: _creditHours,
              min: 2,
              max: 28,
              divisions: 13,
              // (28 - 2) / 2 = 13 steps of 2 credits
              labels: RangeLabels(
                _creditHours.start.round().toString(),
                _creditHours.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _creditHours = values;
                });
              },
            ),

            Center(
              child: Text(
                "${_creditHours.start.round()} - ${_creditHours.end.round()} hours",
                style: theme.titleSmall,
              ),
            ),
            const SizedBox(height: 24),

            // Section for Days Off
            Text("Preferred Days Off", style: theme.titleMedium),
            const SizedBox(height: 4),
            Text(
              "Choose your preferred days off.",
              style: theme.titleSmall!.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Wrap(spacing: 8.0, runSpacing: 4.0, children: _buildDayChips()),

            const Spacer(),

            PrimaryButton(
              title: "GENERATE SCHEDULES",
              onTap: () async{
                final minCredits = _creditHours.start.round();
                final maxCredits = _creditHours.end.round();
                final selectedDays = _daysOff.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toSet();
                ScheduleGenerator generator = ScheduleGenerator();
               List<ScheduleModel> schedules = await generator.generateSchedules(
                  allCourses: widget.courses,
                  minHours: minCredits,
                  maxHours: maxCredits,
                  preferredDaysOff: selectedDays,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestedSchedulesScreen(schedules: schedules,),));
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDayChips() {
    return _daysOff.keys.map((DayOfWeek day) {
      return FilterChip(
        label: Text(day.name),
        selected: _daysOff[day]!,
        onSelected: (bool selected) {
          setState(() {
            _daysOff[day] = selected;
          });
        },
        selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
        checkmarkColor: Theme.of(context).primaryColor,
      );
    }).toList();
  }
}
