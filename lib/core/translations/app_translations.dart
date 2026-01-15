import 'locales/gh_GH.dart';
import 'locales/hi_IN.dart';
import 'locales/fr_FR.dart';
import 'locales/ar_SY.dart';
import 'package:get/get.dart';
import 'locales/en_US.dart';
import 'locales/id_ID.dart';
import 'locales/it_IT.dart';
import 'locales/jp_JP.dart';
import 'locales/ru_RU.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_SY': arSY,
        'fr_FR': frFR,
        'id_ID': idID,
        'hi_IN': hiIN,
        'gh_GH': ghGH,
        'it_IT': itIT,
        'jp_Jp': jpJP,
        'ru_RU': ruRU
      };
}
