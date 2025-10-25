import 'package:flutter/material.dart';
import 'package:tanzimak/widgets/primary_button.dart';

import '../../../core/data/course_model.dart';
import '../../../l10n/app_localizations.dart';

/// A widget to pick a day of the week, a start time, and an end time.
class TimeSlotPicker extends StatefulWidget {
  /// Callback function that is triggered when the save button is pressed.
  /// It provides the newly created [TimeSlot].
  final void Function(TimeSlot) onSave;

  const TimeSlotPicker({super.key, required this.onSave});

  @override
  State<TimeSlotPicker> createState() => _TimeSlotPickerState();
}

class _TimeSlotPickerState extends State<TimeSlotPicker> {
  // Default values
  DayOfWeek _selectedDay = DayOfWeek.monday;
  TimeOfDay _startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 17, minute: 0);

  /// Shows the time picker dialog to select either start or end time.
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  /// Helper function to get localized day name
  String _getLocalizedDayName(DayOfWeek day, AppLocalizations l10n) {
    switch (day) {
      case DayOfWeek.monday:
        return l10n.monday;
      case DayOfWeek.tuesday:
        return l10n.tuesday;
      case DayOfWeek.wednesday:
        return l10n.wednesday;
      case DayOfWeek.thursday:
        return l10n.thursday;
      case DayOfWeek.friday:
        return l10n.friday;
      case DayOfWeek.saturday:
        return l10n.saturday;
      case DayOfWeek.sunday:
        return l10n.sunday;
    }
  }

  /// Validates the times and calls the onSave callback.
  void _handleSave() {
    // Validation: End time must be after start time.
    double startTimeInMinutes = _startTime.hour * 60.0 + _startTime.minute;
    double endTimeInMinutes = _endTime.hour * 60.0 + _endTime.minute;

    if (endTimeInMinutes <= startTimeInMinutes) {
      // Show an error message if validation fails
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.endTimeMustBeAfterStart),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final newTimeSlot = TimeSlot(
      day: _selectedDay,
      startTime: _startTime,
      endTime: _endTime,
    );

    widget.onSave(newTimeSlot);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: DropdownButtonFormField<DayOfWeek>(
              value: _selectedDay,
              decoration: InputDecoration(
                labelText: l10n.dayOfTheWeek,
                prefixIcon: Icon(Icons.calendar_today),
              ),
              items: DayOfWeek.values.map((DayOfWeek day) {
                // Get localized day name
                String dayName = _getLocalizedDayName(day, l10n);
                return DropdownMenuItem<DayOfWeek>(
                  value: day,
                  child: Text(dayName),
                );
              }).toList(),
              onChanged: (DayOfWeek? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDay = newValue;
                  });
                }
              },
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.access_time, color: Colors.greenAccent),
            title: Text(l10n.startTime),
            trailing: Text(
              _startTime.format(context),
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            onTap: () => _selectTime(context, true),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.access_time_filled, color: Colors.redAccent),
            title: Text(l10n.endTime),
            trailing: Text(
              _endTime.format(context),
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            onTap: () => _selectTime(context, false),
          ),
        ),

        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: PrimaryButton(
            onTap: _handleSave,
            title: l10n.saveSchedule,
          ),
        ),
      ],
    );
  }
}