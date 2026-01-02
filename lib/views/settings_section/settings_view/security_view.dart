
import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:appoitment_app/views/settings_section/settings_controller/security_controller.dart';
import 'package:appoitment_app/views/settings_section/settings_view/widgets/settings_header.dart';
import 'package:appoitment_app/views/settings_section/settings_view/widgets/settings_item.dart';
import 'package:appoitment_app/views/settings_section/settings_view/widgets/switch_tile.dart';
import 'package:appoitment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appoitment_app/widgets/general_widgets/custom_divider.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityPage extends StatelessWidget {
  SecurityPage({super.key});

  final SecurityController controller = Get.put(SecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [


          SettingsHeader(
            title: "security".tr,

          ),
          switchTile(
            title: 'remember_password'.tr,
            value: controller.rememberPassword,
          ),
          CustomDivider(),
          switchTile(
            title: 'face_id'.tr,
            value: controller.faceId,
          ),
          CustomDivider(),
          switchTile(
            title: 'pin'.tr,
            value: controller.pin,
          ),
          CustomDivider(),
          settingItem(onTap: () {}, title: "google_authenticator".tr),
        ],
      ),
    );
  }

  }

