import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationDoctor extends StatelessWidget {
  LocationDoctor({
    super.key,
    this.top,
    this.right,
    this.left,
    required this.image,
    this.width,
    this.height,
    this.widthimage,
    this.heightimage,
  });
  final double? top;
  final double? right;
  final double? left;
  final String image;
  final double? width;
  final double? height;
  final double? widthimage;
  final double? heightimage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: Container(
        width: width?.w ?? 50.w,
        height: height?.h ?? 50.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: widthimage ?? 48.w,
              height: heightimage ?? 48.h,
            ),
          ),
        ),
      ),
    );
  }
}
