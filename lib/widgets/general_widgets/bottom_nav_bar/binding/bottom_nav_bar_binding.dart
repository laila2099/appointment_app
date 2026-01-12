import 'package:appointment_app/views/inbox_section/controller/inbox_controller.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    Get.lazyPut<InboxController>(() => InboxController(), fenix: true);
    Get.lazyPut<MyAppointmentsController>(() => MyAppointmentsController(),
        fenix: true);
  }
}
