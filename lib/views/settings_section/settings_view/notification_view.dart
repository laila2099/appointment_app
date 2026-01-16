import 'package:appointment_app/views/settings_section/settings_controller/notificaions_controllers.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/settings_header.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/switch_tile.dart';
import 'package:appointment_app/widgets/general_widgets/custom_divider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SettingsHeader(
            title: "notification".tr,
          ),
          switchTile(
            title: 'notification_from_docnow'.tr,
            value: controller.docNow,
          ),
          CustomDivider(),
          switchTile(
            title: 'sound'.tr,
            value: controller.sound,
          ),
          CustomDivider(),
          switchTile(
            title: 'vibrate'.tr,
            value: controller.vibrate,
          ),
          CustomDivider(),
          switchTile(
            title: 'app_updates'.tr,
            value: controller.appUpdates,
          ),
          CustomDivider(),
          switchTile(
            title: 'special_offers'.tr,
            value: controller.specialOffers,
          ),
        ],
      ),
    );
  }
}
