import 'package:get/get.dart';
import '../../../../core/classes/api/api.dart';
import '../../../../core/classes/repositories/appointment_repository.dart';
import '../../../../core/config/app_config.dart';
import '../booking_appointment_controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    final apiClient = ApiClient(baseUrl: AppConfig.baseUrl);
    final repo = AppointmentRepository(apiClient);

    Get.lazyPut(() => BookingController(repository: repo));
  }
}

