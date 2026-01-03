import 'package:get/get.dart';

import '../doctor_details_controller/doctor_details_controller.dart';

class DoctorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorDetailsController());
  }
}
