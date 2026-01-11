import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/classes/api/api_result.dart';
import '../../../../../core/classes/repositories/auth_repository.dart';
import '../../../../../core/classes/utils/app_snackbar.dart';
import '../../../../../core/services/shared_prefrences.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository repo;
  final AppPreferencesService prefs;

  ForgotPasswordController({required this.repo, required this.prefs});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  Future<void> resetPassword() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
      AppSnackBar.error('Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      final res = await repo.resetPassword(
        email: emailController.text.trim(),
        newPassword: newPasswordController.text.trim(),
      );

      if (res is ApiSuccess) {
        AppSnackBar.success('Password reset successfully');
        Get.back();
      } else if (res is ApiFailure) {
        AppSnackBar.error(res.error.message);
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
