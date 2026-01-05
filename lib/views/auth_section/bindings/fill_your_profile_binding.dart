import 'package:get/get.dart';

import '../../../core/classes/api/api.dart';
import '../../../core/classes/repositories/profile_repository.dart';
import '../../../core/config/app_config.dart';
import '../../../core/services/shared_prefrences.dart';
import '../auth_controller/fill_your_profile_controller.dart';

class AuthFillProfileBinding extends Bindings {
  @override
  void dependencies() {
    final api = ApiClient(baseUrl: AppConfig.baseUrl);

    Get.lazyPut(() => ProfileRepository(api: api));
    Get.lazyPut(() => AuthFillProfileController(
        repo: Get.find<ProfileRepository>(),
        prefs: Get.find<AppPreferencesService>()));
  }
}
