import 'package:flutter/material.dart';
import '../app_colors/app_light_color.dart';
AppLightColors appLightColors = AppLightColors();
ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    appBarTheme: AppBarTheme(backgroundColor: appLightColors.lightBackgroundColor),
    cardColor: Colors.white,
    iconTheme: IconThemeData(color: appLightColors.lightIconsColor),
    scaffoldBackgroundColor: appLightColors.lightBackgroundColor,
    //backgroundColor: appLightColors.lightBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appLightColors.lightBottomNavigationColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),
  );
}