import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_header.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_item.dart';
import 'package:appointment_app/widgets/general_widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/classes/utils/dialogs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SettingsHeader(
            title: "settings".tr,
          ),
          settingItem(
            icon: AppIcons.notification,
            title: 'notification'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.notificationPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: AppIcons.faq,
            title: 'faq'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.helpPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: AppIcons.security,
            title: 'security'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.securityPage);
            },
          ),
          CustomDivider(),
          settingItem(
            icon: AppIcons.language,
            title: 'language'.tr,
            onTap: () {
              Get.toNamed(AppRoutes.languageScreen);
            },
          ),
          CustomDivider(),
          settingItem(
            icon:AppIcons.logout,
            title: 'logout'.tr,
            color: AppColors.red,
            onTap: () {
              showLogoutDialog();
            },
          ),
           CustomDivider(),
        ],
      ),
    );
  }
}
