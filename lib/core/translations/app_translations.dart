import 'locales/fr_FR.dart';

import 'locales/ar_SY.dart';
import 'package:get/get.dart';

import 'locales/en_US.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUS, 'ar_SY': arSY, 'fr_FR': frFR};
}
