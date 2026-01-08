import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart'
    show ProfileController;
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../models/user_profile_model.dart';

class PersonalInfoController extends GetxController {
  // Text placeholders
  final name = ''.obs;
  final email = ''.obs;
  final password = 'Password'.obs;

  // Phone
  final selectedCountry = Country.parse('GB').obs;
  final phoneController = TextEditingController();

  late final ProfileController profileController;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();

    ever(profileController.profile, (UserProfile? profile) {
      if (profile != null) {
        name.value = profile.name;
        phoneController.text = profile.phone;
      }
    });
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
    phoneController.dispose();
    super.onClose();
  }
}
