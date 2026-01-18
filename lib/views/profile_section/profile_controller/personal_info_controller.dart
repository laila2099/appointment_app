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
  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();

    final profileData = profileController.profile.value;

    if (profileData != null && (profileData.phone.isNotEmpty)) {
      _fillAllFields(profileData.name, profileData.email, profileData.birthdate,
          profileData.phone);
    }

    _profileWorker = ever<UserProfile?>(
      profileController.profile,
      (profile) {
        if (profile != null) {
          _fillAllFields(
              profile.name, profile.email, profile.birthdate, profile.phone);
        }
      },
    );
  }

  void _fillAllFields(String name, String email, String? birth, String phone) {
    nameController.text = name;
    emailController.text = email;
    if (birth != null && birth.isNotEmpty) {
      try {
        DateTime parsedDate = DateTime.parse(birth);
        birthdateController.text =
            "${parsedDate.day.toString().padLeft(2, '0')}/"
            "${parsedDate.month.toString().padLeft(2, '0')}/"
            "${parsedDate.year}";
      } catch (e) {
        birthdateController.text = birth;
      }
    } else {
      birthdateController.text = '';
    }
    _applyPhoneFromProfile(phone);
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

  void pickBirthday() async {
    DateTime initialDate =
        DateTime.tryParse(birthdateController.text) ?? DateTime(2000);
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
      birthdateController.text = formattedDate;
    }
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
