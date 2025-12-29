import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/en_US.dart';

class AppTranslations extends Translations {
  static const Locale en = Locale('en', 'US');
  static const Locale ar = Locale('ar', 'SY');

  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS};
}
