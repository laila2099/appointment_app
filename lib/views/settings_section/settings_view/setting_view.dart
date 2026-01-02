<<<<<<< Updated upstream
import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:appoitment_app/routes/app_routes.dart';
import 'package:appoitment_app/views/settings_section/settings_view/widgets/settings_item.dart';
import 'package:appoitment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appoitment_app/widgets/general_widgets/custom_divider.dart';
=======
import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/profile_section/profile_view/widgets/profile_header.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_header.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_item.dart';
import 'package:appointment_app/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/custom_divider.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
     
      body: Column(
        
        children: [
       SettingsHeader(title: "settings".tr,),
          settingItem(
            icon: Icons.notifications_none,
            title: 'notification'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.notificationPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: Icons.help_outline,
            title: 'faq'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.helpPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: Icons.lock_outline,
            title: 'security'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.securityPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: Icons.language,
            title: 'language'.tr,
            onTap: () {},
          ),
          CustomDivider(),
          settingItem(
            icon: Icons.logout,
            title: 'logout'.tr,
            color: AppColors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
