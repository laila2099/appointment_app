import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
        onPressed: () => Get.back(),
      ),
      center: Text(
        'Profile',
        style: CustomTextStyles.screenTitle.copyWith(color: AppColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.settings, color: AppColors.white),
        onPressed: () {
          Get.toNamed(AppRoutes.settingsPage);
        },
      ),
    );
  }
}
