import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortChip extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool active;

  const SortChip({required this.title, this.icon, this.active = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.search,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, size: 16.sp, color: active ? Colors.white : Colors.grey),
          if (icon != null) SizedBox(width: 6.w),
          Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }
}
