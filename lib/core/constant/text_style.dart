import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyles {
  CustomTextStyles._(); // prevents instantiation

  static const String _fontFamily = 'Inter';

  static TextStyle container = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    color: AppColors.white,
    height: 1.6.h,
  );

  static TextStyle medium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle specialitytext = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.black,
  );

  static TextStyle nameperson = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    color: AppColors.black,
  );

  static TextStyle semiBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static TextStyle bold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.black,
  );

  static TextStyle regular = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.primary,
  );

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
