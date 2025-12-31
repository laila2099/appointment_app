import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/settings_section/settings_controller/notificaions_controllers.dart';
import 'package:appointment_app/views/settings_section/settings_view/widgets/switch_tile.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
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
          AppHeader(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            center: Text(
              "Notification",
              style: CustomTextStyles.screenTitle,
            ),
            trailing: Text(""),
          ),
          switchTile(
            title: 'Notification from DocNow',
            value: controller.docNow,
          ),
          CustomDivider(),
          switchTile(
            title: 'Sound',
            value: controller.sound,
          ),
          CustomDivider(),
          switchTile(
            title: 'Vibrate',
            value: controller.vibrate,
          ),
          CustomDivider(),
          switchTile(
            title: 'App Updates',
            value: controller.appUpdates,
          ),
          CustomDivider(),
          switchTile(
            title: 'Special Offers',
            value: controller.specialOffers,
          ),
        ],
      ),
    );
  }
}
