import 'package:flutter/material.dart';
import '../app_colors/app_dark_color.dart';
AppDarkColors appDarkColors =AppDarkColors();
  ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    appBarTheme: AppBarTheme(backgroundColor: appDarkColors.darkScaffoldColor),
    backgroundColor: appDarkColors.darkBackgroundColor,
    scaffoldBackgroundColor: appDarkColors.darkScaffoldColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appDarkColors.darkBottomNavigationColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),
  );
}