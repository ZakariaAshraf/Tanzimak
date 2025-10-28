import 'package:flutter/material.dart';
class AppTheme {
  static ThemeData getApplicationLightTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        // textTheme: AppTextTheme.lightTextTheme,
    );
  }

  static ThemeData getApplicationDarkTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // textTheme: AppTextTheme.darkTextTheme,
    );
  }
}