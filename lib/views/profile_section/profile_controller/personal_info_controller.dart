import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PersonalInfoController extends GetxController {
  // Text placeholders
  final name = 'Omar Ahmed'.obs;
  final email = 'omarahmed14@gmail.com'.obs;
  final password = 'Password'.obs;

  // Phone
  final selectedCountry = Country.parse('GB').obs;
  final phoneController = TextEditingController();

  void onCountrySelected(Country country) {
    selectedCountry.value = country;
  }

  String get fullPhoneNumber {
    return '+${selectedCountry.value.phoneCode}${phoneController.text}';
  }

  void onSave() {}

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
