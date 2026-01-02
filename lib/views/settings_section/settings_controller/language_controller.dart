import 'package:get/get.dart';

class LanguageModel {
  final String name;
  final String code;

  LanguageModel({required this.name, required this.code});
}

class LanguageController extends GetxController {
  final selectedCode = 'en'.obs;

  final allLanguages = <LanguageModel>[
    LanguageModel(name: 'Arab', code: 'ar'),
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(name: 'France', code: 'fr'),
    LanguageModel(name: 'Ghana', code: 'gh'),
    LanguageModel(name: 'Indonesia', code: 'id'),
    LanguageModel(name: 'India', code: 'in'),
    LanguageModel(name: 'Italia', code: 'it'),
    LanguageModel(name: 'Japan', code: 'jp'),
    LanguageModel(name: 'Russia', code: 'ru'),
  ];

  final languages = <LanguageModel>[].obs;
  final searchText = ''.obs;

  @override
  void onInit() {
    languages.assignAll(allLanguages);
    super.onInit();
  }

  void selectLanguage(String code) {
    selectedCode.value = code;
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
}
