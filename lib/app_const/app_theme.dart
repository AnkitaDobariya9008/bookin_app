import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData().copyWith(
      splashFactory: NoSplash.splashFactory,
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
            fontSize: 14),
        titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
            fontSize: 18),
        titleLarge: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
            fontSize: 20),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor,
          selectionHandleColor: AppColors.primaryColor));
}
