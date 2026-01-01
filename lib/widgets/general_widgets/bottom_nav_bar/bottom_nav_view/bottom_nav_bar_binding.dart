import 'package:get/get.dart';

import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
