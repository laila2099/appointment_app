import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavBarIcon extends GetView<NavigationController> {
  final String iconPath;
  final int index;
  final bool hasBadge;

  const NavBarIcon({
    required this.iconPath,
    required this.index,
    this.hasBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isActive = controller.selectedIndex == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 50.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  isActive ? AppColors.primary : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              if (hasBadge)
                Positioned(
                  top: 1.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2.w),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
