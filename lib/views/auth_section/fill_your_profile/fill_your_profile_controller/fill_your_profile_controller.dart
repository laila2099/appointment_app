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

  // Form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final fullNameController = TextEditingController();
  final birthdateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneRx = ''.obs;

  // State
  final isLoading = false.obs;
  final errorText = RxnString();

  @override
  void onInit() {
    super.onInit();
    // تحميل البريد من argument
    emailController.text = (Get.arguments?['email'] ?? '') as String;

    // مسح الأخطاء عند أي تعديل في الحقول
    fullNameController.addListener(() => errorText.value = null);
    birthdateController.addListener(() => errorText.value = null);
    emailController.addListener(() => errorText.value = null);
  }

  /// تحقق من صحة النموذج قبل الإرسال
  bool validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      AppSnackBar.error('Please fix the errors in the form');
    }
    return isValid;
  }

  /// حفظ الملف الشخصي
  Future<void> setProfile() async {
    if (!validateForm()) return;

    isLoading.value = true;
    errorText.value = null;

    try {
      final accessToken = prefs.getString(PrefKeys.accessToken);
      final userId = prefs.getString(PrefKeys.userId);

      if (accessToken == null ||
          accessToken.isEmpty ||
          userId == null ||
          userId.isEmpty) {
        AppSnackBar.error('auth_session_missing');
        Get.offAllNamed(AppRoutes.login);
        return;
      }

      final res = await repo.setProfile(
        accessToken: accessToken,
        id: userId,
        email: emailController.text.trim(),
        fullName: fullNameController.text.trim(),
        phone: phoneRx.value.trim(),
        birthdate: (birthdateController.text.trim().isEmpty)
            ? null
            : birthdateController.text.trim(),
      );

      if (res is ApiSuccess<UserProfile>) {
        AppSnackBar.success('profile_saved');
        Get.offAllNamed(AppRoutes.bottomnavbar);
      } else if (res is ApiFailure<UserProfile>) {
        errorText.value = res.error.message;
        AppSnackBar.error('profile_save_failed');
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    birthdateController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
