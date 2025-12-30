import 'package:app_appointment/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
