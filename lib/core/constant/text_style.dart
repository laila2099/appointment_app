import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  CustomTextStyles._(); // prevents instantiation

  static const String _fontFamily = 'Inter';

  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.white,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColors.primary,
  );

  static const TextStyle textField = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.textField,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.subtitle,
  );

  static TextStyle custom({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }
}
