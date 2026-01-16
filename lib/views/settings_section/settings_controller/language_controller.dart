import 'package:get/get.dart';
import '../../../core/translations/controller/translation_controller.dart';

class LanguageModel {
  final String name;
  final String code;
  LanguageModel({required this.name, required this.code});
}

class LanguageController extends GetxController {
  final TranslationController _translationController =
      Get.find<TranslationController>();

  final selectedCode = ''.obs;

  final searchText = ''.obs;

  final allLanguages = <LanguageModel>[
    LanguageModel(name: 'Arabic', code: 'ar'),
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(name: 'French', code: 'fr'),
    LanguageModel(name: 'Ghana', code: 'gh'),
    LanguageModel(name: 'Indonesia', code: 'id'),
    LanguageModel(name: 'India', code: 'in'),
    LanguageModel(name: 'Italian', code: 'it'),
    LanguageModel(name: 'Japanese', code: 'jp'),
    LanguageModel(name: 'Russian', code: 'ru'),
  ];

  final languages = <LanguageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    languages.assignAll(allLanguages);

    selectedCode.value = _translationController.locale.value.languageCode;
  }

  void searchLanguage(String value) {
    searchText.value = value;
    if (value.isEmpty) {
      languages.assignAll(allLanguages);
    } else {
      languages.assignAll(
        allLanguages.where(
          (e) => e.name.toLowerCase().contains(value.toLowerCase()),
        ),
      );
    }
  }

  void selectLanguage(String code) {
    selectedCode.value = code;
  }

  void applyLanguage() {
    _translationController.changeLocale(selectedCode.value);
  }
}
