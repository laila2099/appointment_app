import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../../core/classes/api/api.dart';
import '../../../core/classes/repositories/profile_repository.dart';
import '../../../core/config/app_config.dart';
import '../profile_controller/personal_info_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ApiClient>(
          () => ApiClient(
        baseUrl: AppConfig.baseUrl,
      ),
    );

    Get.lazyPut<ProfileRepository>(
          () => ProfileRepository(api: Get.find<ApiClient>()),
    );

    Get.lazyPut<ProfileController>(
          () => ProfileController(
        repository: Get.find<ProfileRepository>(),
      ),
      fenix: true, // مهم جداً
    );

    Get.lazyPut<PersonalInfoController>(
          () => PersonalInfoController(),
      fenix: true, // حتى لو تم التخلص منه، يرجع يتنشأ تلقائياً
    );
  }
}
