import 'package:appointment_app/views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import 'package:get/get.dart';

class MyAppoitmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppointmentsController());
  }
}
