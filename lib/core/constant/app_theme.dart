import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: Colors.white,
        todayForegroundColor: WidgetStatePropertyAll(AppColors.primary),
        todayBackgroundColor: WidgetStatePropertyAll(Colors.transparent),
        todayBorder: BorderSide(color: AppColors.primary),
      ),
    );
  }
}
