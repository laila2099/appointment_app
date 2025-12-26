import 'dart:ui';

import 'package:appoitment_app/core/services/shared_prefrences.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  Locale? locale;
  late final AppPreferencesService myServices;

  void changeLocale(Locale locale) {
    final langCode = locale.languageCode;
    myServices.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    myServices = Get.find<AppPreferencesService>();
    String langCode = myServices.getString("lang") ?? "en";
    locale = Locale(langCode);
    super.onInit();
  }
}
