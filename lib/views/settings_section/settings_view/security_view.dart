import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/settings_section/settings_controller/security_controller.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_item.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/switch_tile.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/custom_divider.dart';
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
          AppHeader(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            center: Text(
              "Security",
              style: CustomTextStyles.screenTitle,
            ),
            trailing: Text(""),
          ),
          switchTile(
            title: 'Remember password',
            value: controller.rememberPassword,
          ),
          CustomDivider(),
          switchTile(
            title: 'Face ID',
            value: controller.faceId,
          ),
          CustomDivider(),
          switchTile(
            title: 'PIN',
            value: controller.pin,
          ),
          CustomDivider(),
          settingItem(onTap: () {}, title: "Google Authenticator"),
        ],
      ),
    );
  }
}
