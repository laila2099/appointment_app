import 'package:appointment_app/views/settings_section/settings_controller/help_controllers.dart';
import 'package:appointment_app/views/settings_section/settings_controller/notificaions_controllers.dart';
import 'package:appointment_app/views/settings_section/settings_controller/security_controller.dart';
import 'package:appointment_app/views/settings_section/settings_controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => SecurityController());
    Get.lazyPut(() => HelpController());
    Get.lazyPut(() => NotificationController());
  }
}
