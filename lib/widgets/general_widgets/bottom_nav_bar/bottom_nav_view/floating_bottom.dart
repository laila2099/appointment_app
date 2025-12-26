import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/app_icons.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FloatingSearchButton extends GetView<NavigationController> {
  const FloatingSearchButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.changeIndex(2),
      child: Container(
        height: 75.h,
        width: 75.w,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppIcons.search,
              width: 24.sp,
              height: 24.sp,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
