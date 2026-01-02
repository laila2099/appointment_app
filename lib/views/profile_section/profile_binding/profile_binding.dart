import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart';
import 'package:get/get.dart';

import '../profile_controller/personal_info_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.put(PersonalInfoController());
  }
}
