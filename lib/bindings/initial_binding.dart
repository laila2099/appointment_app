import 'package:get/get.dart';
import '../core/classes/api/api.dart';
import '../core/classes/repositories/appointment_repository.dart';
import '../core/classes/repositories/auth_repository.dart';
import '../core/classes/repositories/doctor_repository.dart';
import '../core/classes/repositories/review_repository.dart';
import '../core/config/app_config.dart';
import '../core/services/shared_prefrences.dart';
import '../views/auth_section/auth_controller/auth_controller.dart';
import '../views/home_section/booking_appointment/booking_appointment_controller/booking_controller.dart';
import '../views/inbox_section/controller/inbox_controller.dart';
import '../views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import '../widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class InitializeBinding extends Bindings {
  @override
  void dependencies() {
    final api = ApiClient(baseUrl: AppConfig.baseUrl);
    final repo = AppointmentRepository(api: api);

    Get.lazyPut<BookingController>(() => BookingController(repository: repo));

    Get.put(AuthRepository(api: api));
    Get.put(DoctorRepository(api: api));
    Get.put(ReviewRepository(api: api));

    Get.put(AuthController(
      repo: Get.find<AuthRepository>(),
      prefs: Get.find<AppPreferencesService>(),
    ));

    Get.put(MyAppointmentsController());
    Get.put(InboxController());
    Get.put(NavigationController());
  }
}
