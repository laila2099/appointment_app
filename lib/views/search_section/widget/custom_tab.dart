import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isSmall;

  const CustomTab({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAllTab = label == 'All';

    final Color backgroundColor =
        isSelected || isAllTab ? AppColors.primary : AppColors.light2Grey;

    final Color textColor =
        isSelected || isAllTab ? AppColors.white : AppColors.black;

    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmall ? 12.w : 20.w,
            vertical: isSmall ? 6.h : 12.h,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: isSelected || isAllTab
                  ? AppColors.primary
                  : Colors.grey.shade400,
              width: 1.5.w,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: isSmall ? 14.sp : 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
