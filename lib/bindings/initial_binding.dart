import 'package:get/get.dart';
import '../views/inbox_section/controller/inbox_controller.dart';
import '../views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import '../widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل MyAppointmentsController
    Get.lazyPut(() => MyAppointmentsController());

    // تسجيل InboxController
    Get.lazyPut(() => InboxController());

    // تسجيل NavigationController ✅
    Get.lazyPut(() => NavigationController());
  }
}
