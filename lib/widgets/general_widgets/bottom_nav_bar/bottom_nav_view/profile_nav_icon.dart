import 'dart:io';

import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileNavIcon extends GetView<NavigationController> {
  final int index;
  const ProfileNavIcon({required this.index});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();

    return Obx(() {
      final File? avatarFile = profileController.avatarFile.value;

      final bool isActive = controller.selectedIndex == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: Container(
          padding: EdgeInsetsDirectional.all(2.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.primary : AppColors.transparent,
              width: 2.w,
            ),
          ),
          child: CircleAvatar(
            radius: 14.r,
            backgroundImage: avatarFile != null
                ? FileImage(avatarFile)
                : const NetworkImage(
                    "https://i.pravatar.cc/150?u=user_profile",
                  ) as ImageProvider,
          ),
        ),
      );
    });
  }
}
