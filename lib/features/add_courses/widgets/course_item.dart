import 'package:flutter/material.dart';
import 'package:tanzimak/core/config/app_colors.dart';
import 'package:tanzimak/core/data/course_model.dart';
import '../../../l10n/app_localizations.dart';

class CourseItem extends StatelessWidget {
  final CourseModel item;
  final Function() onTap;

  const CourseItem({super.key, required this.item, required this.onTap});

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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final timingsList = item.timings.map((slot) {
      final String dayName = _getLocalizedDayName(slot.day, l10n);

      final String timeRange =
          "${slot.startTime.format(context)} - ${slot.endTime.format(context)}";
      return "$dayName: $timeRange";
    });
    final String timingsString = timingsList.join("\n");

    return Card(
      child: ListTile(
        title: Text(
          item.name,
          style: theme.titleMedium,
        ),
        subtitle: Text(
          "$timingsString\n${item.creditHours}${l10n.hours}",
          style: theme.bodySmall?.copyWith(color: Colors.grey[700]),
        ),
        leading: Icon(
          Icons.book,
          color: AppColors.primary,
        ),
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(Icons.close, color: Colors.red),
        ),
      ),
    );
  }
}
