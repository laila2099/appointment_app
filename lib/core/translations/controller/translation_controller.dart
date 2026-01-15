import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appointment_app/core/services/shared_prefrences.dart'; // تأكد من المسار

class TranslationController extends GetxController {
  late final AppPreferencesService myServices;

  static const String langKey = 'lang_code';

  var locale = const Locale('en', 'US').obs;

  final Map<String, Locale> supportedLocales = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'SY'),
    'fr': const Locale('fr', 'FR'),
    'id': const Locale('id', 'ID'),
    'hi': const Locale('hi', 'IN'),
    'gh': const Locale('gh', 'GH'),
    'it': const Locale('it', 'IT'),
    'jp': const Locale('jp', 'JP'),
    'ru': const Locale('ru', 'RU'),
  };

  @override
  void onInit() {
    super.onInit();
    myServices = Get.find<AppPreferencesService>();
    _loadLanguage();
  }

  void changeLocale(String languageCode) {
    if (supportedLocales.containsKey(languageCode)) {
      final newLocale = supportedLocales[languageCode]!;
      locale.value = newLocale;
      Get.updateLocale(newLocale);
      myServices.setString(langKey, languageCode);
    }
  }

  void _loadLanguage() {
    String? sharedPrefLang = myServices.getString(langKey);

    if (sharedPrefLang != null &&
        supportedLocales.containsKey(sharedPrefLang)) {
      locale.value = supportedLocales[sharedPrefLang]!;
    } else {
      locale.value = const Locale('en', 'US');
    }
    Get.updateLocale(locale.value);
  }
}
