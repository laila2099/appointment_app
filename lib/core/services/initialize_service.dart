import 'package:appointment_app/core/services/shared_prefrences.dart';
import 'package:get/get.dart';

import 'auth_gate_service.dart';

Future<void> initServices() async {
  await Get.putAsync<AppPreferencesService>(
    () async => await AppPreferencesService().init(),
  );
  Get.put(AuthGateService());
}
