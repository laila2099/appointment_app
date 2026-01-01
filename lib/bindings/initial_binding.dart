import 'package:get/get.dart';

import '../views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppointmentsController());
  }
}
