import 'locales/fr_FR.dart';

import 'locales/ar_SY.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/en_US.dart';

class AppTranslations extends Translations {
  // static const Locale en = Locale('en', 'US');
  // static const Locale ar = Locale('ar', 'SY');
  // static const Locale fr = Locale('fr', 'FR');

  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enUS, 'ar_SY': arSY, 'fr_FR': frFR};
}
