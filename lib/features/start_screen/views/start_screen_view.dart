import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanzimak/core/config/app_colors.dart';
import 'package:tanzimak/widgets/primary_button.dart';

import '../../../core/config/locale/provider/locale_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../add_courses/views/add_courses_screen.dart';

class StartScreenView extends ConsumerWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);
    final isEnglish = locale?.languageCode == 'en';
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: isEnglish,
            onChanged: (isEnglish) {
              final newLocale = isEnglish
                  ? const Locale('en')
                  : const Locale('ar');
              ref.read(localeProvider.notifier).setLocale(newLocale);
            },
            thumbIcon: WidgetStateProperty.all(
              Icon(Icons.language, color: Colors.black),
            ),
            activeColor: AppColors.primary,
            hoverColor: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 160),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(l10n.tanzimak, style: theme.displayLarge),
                Text(
                  l10n.buildYourPerfectSchedule,
                  style: theme.bodyMedium!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: PrimaryButton(
              title: l10n.getStarted,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCoursesScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
