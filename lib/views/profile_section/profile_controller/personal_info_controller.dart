import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart'
    show ProfileController;
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_keys.dart';
import '../../../core/services/shared_prefrences.dart';
import '../../../models/user_profile_model.dart';

class PersonalInfoController extends GetxController {
  final password = 'Password'.obs;
  final AppPreferencesService prefs = Get.find<AppPreferencesService>();

  final selectedCountry = Country.parse('GB').obs;
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthdateController = TextEditingController();

  late final ProfileController profileController;
  late final Worker _profileWorker;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
    final userId = prefs.getString(PrefKeys.userId);
    print(userId);

    final profile = profileController.profile.value;
    if (profile != null) {
      nameController.text = profile.name;
      emailController.text = profile.email;
      birthdateController.text = profile.birthdate ?? '';
      print(profile.phone);
      _applyPhoneFromProfile(profile.phone);
    }

    _profileWorker = ever<UserProfile?>(
      profileController.profile,
      (profile) {
        if (profile != null) {
          nameController.text = profile.name;
          emailController.text = profile.email;
          birthdateController.text = profile.birthdate ?? '';
          phoneController.text = profile.phone ?? '';
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
      fullName: nameController.text,
      phone: fullPhoneNumber,
      birthdate: birthdateController.text != ''
          ? birthdateController.text.toString()
          : null,
      email: emailController.text,
    );
  }

  @override
  void onClose() {
    _profileWorker.dispose();
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    birthdateController.dispose();
    super.onClose();
  }
}
