import 'package:appointment_app/core/services/shared_prefrences.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Get.putAsync<AppPreferencesService>(
    () async => await AppPreferencesService().init(),
  );
}
