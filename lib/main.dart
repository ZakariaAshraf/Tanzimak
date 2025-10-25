import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanzimak/features/add_courses/cubit/add_courses_cubit.dart';

import 'core/config/locale/provider/locale_provider.dart';
import 'features/start_screen/views/start_screen_view.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final locale =ref.watch(localeProvider);
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddCoursesCubit())],
      child: MaterialApp(
        title: 'Tanzimak',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        home: StartScreenView(),
      ),
    );
  }
}
