import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart'
    show ProfileController;
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../models/user_profile_model.dart';

class PersonalInfoController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = 'Password'.obs;

  final selectedCountry = Country.parse('GB').obs;
  final phoneController = TextEditingController();

  late final ProfileController profileController;
  late final Worker _profileWorker;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();

    final profile = profileController.profile.value;
    if (profile != null) {
      name.value = profile.name;
      _applyPhoneFromProfile(profile.phone);
    }

    _profileWorker = ever<UserProfile?>(
      profileController.profile,
          (profile) {
        if (profile != null) {
          name.value = profile.name;
          _applyPhoneFromProfile(profile.phone);
        }
      },
    );
  }

  void _applyPhoneFromProfile(String fullPhone) {
    for (final country in CountryService().getAll()) {
      final code = '+${country.phoneCode}';
      if (fullPhone.startsWith(code)) {
        selectedCountry.value = country;
        phoneController.text = fullPhone.substring(code.length);
        return;
      }
    }

    phoneController.text = fullPhone;
  }

  void onCountrySelected(Country country) {
    selectedCountry.value = country;
  }

  String get fullPhoneNumber {
    return '+${selectedCountry.value.phoneCode}${phoneController.text}';
  }

  void onSave() {
    profileController.editProfile(
      fullName: name.value,
      phone: fullPhoneNumber,
    );
  }

  @override
  void onClose() {
    _profileWorker.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
