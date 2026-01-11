import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/translations/controller/translation_controller.dart'; // Verify this path

class LanguageModel {
  final String name;
  final String code;
  LanguageModel({required this.name, required this.code});
}

class LanguageController extends GetxController {
  // Access the main engine
  final TranslationController _translationController =
      Get.find<TranslationController>();

  // Observable for the Checkmark (UI only)
  final selectedCode = ''.obs;

  // Search text
  final searchText = ''.obs;

  // Data
  final allLanguages = <LanguageModel>[
    LanguageModel(name: 'Arabic', code: 'ar'),
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(
        name: 'French',
        code: 'fr'), // Ensure this matches TranslationController keys
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
    // 1. Load all languages
    languages.assignAll(allLanguages);

    // 2. Set the initial checkmark based on the ACTUAL current app language
    selectedCode.value = _translationController.locale.value.languageCode;
  }

  // Filter the list
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

  // Update the UI checkmark (Does NOT change app language yet)
  void selectLanguage(String code) {
    selectedCode.value = code;
  }

  // Commit changes when "Save" is clicked
  void applyLanguage() {
    // Call the main controller to update Locale and SharedPrefs
    _translationController.changeLocale(selectedCode.value);
  }
}
