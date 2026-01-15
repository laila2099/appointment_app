import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/constant/app_size.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_icon.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/floating_bottom.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/profile_nav_icon.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends GetView<NavigationController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.bottomNavHeight,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: AppSize.bottomNavHeight,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            height: AppSize.bottomNavHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(iconPath: AppIcons.home, index: 0),
                NavBarIcon(iconPath: AppIcons.chat, index: 1, hasBadge: true),
                SizedBox(width: 60.w),
                NavBarIcon(iconPath: AppIcons.calendar, index: 3),
                const ProfileNavIcon(index: 4),
              ],
            ),
          ),
          PositionedDirectional(
              bottom: 25.h, child: const FloatingSearchButton()),
        ],
      ),
    );
  }
}
