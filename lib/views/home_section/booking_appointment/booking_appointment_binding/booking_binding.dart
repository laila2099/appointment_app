import 'package:get/get.dart';

import '../booking_appointment_controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingController());
  }
}
