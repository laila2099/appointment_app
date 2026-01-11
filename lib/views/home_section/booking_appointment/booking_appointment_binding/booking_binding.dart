import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../../core/classes/api/api.dart';
import '../../../../core/classes/repositories/appointment_repository.dart';
import '../../../../core/config/app_config.dart';
import '../booking_appointment_controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    final apiClient = ApiClient(baseUrl: AppConfig.baseUrl);

    final repo = AppointmentRepository(
      api: apiClient,
    );

    Get.lazyPut<BookingController>(
          () => BookingController(repository: repo),
    );
  }
}
