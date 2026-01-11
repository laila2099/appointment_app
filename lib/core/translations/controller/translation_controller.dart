// import 'dart:ui';
// import 'package:appointment_app/core/services/shared_prefrences.dart';
// import 'package:get/get.dart';

// class TranslationController extends GetxController {
//   late final AppPreferencesService myServices;

//   var locale = const Locale('en', 'US').obs;

//   final Map<String, Locale> supportedLocales = {
//     'en': const Locale('en', 'US'),
//     'ar': const Locale('ar', 'SY'),
//     'fr': const Locale('fr', 'FR'),
//   };

//   void changeLocale(Locale newLocale) {
//     locale.value = newLocale;
//     myServices.setString("lang", newLocale.languageCode);
//     Get.updateLocale(newLocale);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     myServices = Get.find<AppPreferencesService>();

//     String langCode = myServices.getString("lang") ?? "en";

//     if (supportedLocales.containsKey(langCode)) {
//       locale.value = supportedLocales[langCode]!;
//     } else {
//       locale.value = const Locale('en', 'US');
//     }

//     Get.updateLocale(locale.value);
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appointment_app/core/services/shared_prefrences.dart'; // تأكد من المسار

class TranslationController extends GetxController {
  late final AppPreferencesService myServices;

  // المفتاح الموحد للحفظ
  static const String langKey = 'lang_code';

  // القيمة المبدئية
  var locale = const Locale('en', 'US').obs;

  // قائمة اللغات المدعومة
  final Map<String, Locale> supportedLocales = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'SY'),
    'fr': const Locale('fr', 'FR'),
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
      // حفظ الكود فقط (ar, en, fr)
      myServices.setString(langKey, languageCode);
    }
  }

  void _loadLanguage() {
    // قراءة الكود المحفوظ، إذا لم يوجد نأخذ الإنجليزية كافتراضي
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
