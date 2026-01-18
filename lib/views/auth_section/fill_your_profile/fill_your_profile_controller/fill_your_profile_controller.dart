import 'package:appointment_app/views/profile_section/profile_controller/profile_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/classes/api/api_result.dart';
import '../../../../core/classes/repositories/profile_repository.dart';
import '../../../../core/classes/utils/app_snackbar.dart';
import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/shared_prefrences.dart';
import '../../../../models/user_profile_model.dart';
import '../../../../routes/app_routes.dart';

class AuthFillProfileController extends GetxController {
  final ProfileRepository repo;
  final AppPreferencesService prefs;

  AuthFillProfileController({required this.repo, required this.prefs});
  final formKey = GlobalKey<FormState>();

  // Controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final birthdateController = TextEditingController();
  final phoneRx = ''.obs;
  Rx<DateTime?> birthdate = Rx<DateTime?>(null);

// State
  final isLoading = false.obs;
  final errorText = RxnString();
  final selectedCountry = Country.parse('GB').obs;

  @override
  void onInit() {
    super.onInit();
    emailController.text = (Get.arguments?['email'] ?? '') as String;
    String incomingPhone = (Get.arguments?['phone'] ?? '') as String;
    String? code = Get.arguments?['countryCode'];
    if (code != null) {
      selectedCountry.value = Country.parse(code);
    }
    phoneRx.value = incomingPhone;
    fullNameController.addListener(() => errorText.value = null);
    emailController.addListener(() => errorText.value = null);
    birthdateController.addListener(() => errorText.value = null);
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    birthdateController.dispose();
    super.onClose();
  }

  // Pick Birthday
  Future<void> pickBirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthdate.value ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      birthdate.value = pickedDate;
      birthdateController.text = "${pickedDate.day.toString().padLeft(2, '0')}/"
          "${pickedDate.month.toString().padLeft(2, '0')}/"
          "${pickedDate.year}";
    }
  }

  // Save Profile
  Future<void> saveProfile() async {
    if (!validateForm()) return;

    if (birthdate.value == null) {
      AppSnackBar.error('Please select your birthday');
      return;
    }

    isLoading.value = true;
    errorText.value = null;

    try {
      final accessToken = prefs.getString(PrefKeys.accessToken);
      final userId = prefs.getString(PrefKeys.userId);

      if (accessToken == null || userId == null) {
        Get.offAllNamed(AppRoutes.login);
        return;
      }

      String fullPhone =
          '+${selectedCountry.value.phoneCode}${phoneRx.value.trim()}';

      final res = await repo.setProfile(
        accessToken: accessToken,
        id: userId,
        email: emailController.text.trim(),
        fullName: fullNameController.text.trim(),
        phone: fullPhone,
        birthdate: birthdate.value!.toIso8601String(),
      );

      if (res is ApiSuccess<UserProfile>) {
        if (Get.isRegistered<ProfileController>()) {
          Get.find<ProfileController>().profile.value = res.data;
        }

        AppSnackBar.success('profile_saved');
        Get.offAllNamed(AppRoutes.otpVerification);
      } else if (res is ApiFailure<UserProfile>) {
        errorText.value = res.error.message;
        AppSnackBar.error('profile_save_failed');
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Validation
  bool validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      AppSnackBar.error('Please fix the errors in the form');
    }
    return isValid;
  }

  // Submit Profile (SharedPreferences + Navigation)
  Future<void> submitProfile() async {
    if (isLoading.value) return;

    if (!(formKey.currentState?.validate() ?? false)) {
      AppSnackBar.error('Please fix the errors in the form');
      return;
    }

    if (birthdate.value == null) {
      AppSnackBar.error('Please select your birthday');
      return;
    }

    if (birthdate.value!.isAfter(DateTime.now())) {
      AppSnackBar.error('Birthdate cannot be in the future');
      return;
    }

    isLoading.value = true;
    try {
      final prefs = Get.find<AppPreferencesService>();
      String fullPhone =
          '+${selectedCountry.value.phoneCode}${phoneRx.value.trim()}';
      await prefs.setString('user_name', fullNameController.text.trim());
      await prefs.setString('user_email', emailController.text.trim());
      await prefs.setString(
          'user_birthDate', birthdate.value!.toIso8601String());
      await prefs.setString('user_phoneNumber', fullPhone);
      print("✅ تم حفظ الرقم: $fullPhone");
      Get.offAllNamed('/home');
    } catch (e) {
      AppSnackBar.error('Failed to save data. Try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
