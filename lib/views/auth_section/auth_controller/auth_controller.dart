import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/classes/api/api_result.dart';
import '../../../core/classes/repositories/auth_repository.dart';
import '../../../core/classes/utils/app_snackbar.dart';
import '../../../core/constant/app_keys.dart';
import '../../../core/services/auth_gate_service.dart';
import '../../../core/services/shared_prefrences.dart';
import '../../../models/auth/auth_models.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class AuthController extends GetxController {
  final AuthRepository repo;
  final AppPreferencesService prefs;

  AuthController({
    required this.repo,
    required this.prefs,
  });
  final LoginFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final errorText = RxnString();
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  Future<void> signUp() async {
    print((!(formKey.currentState?.validate() ?? false)));
    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    errorText.value = null;

    final res = await repo.signUp(
        email: emailController.text, password: passwordController.text);

    if (res is ApiSuccess<AuthSession>) {
      await _saveSession(res.data);
      Get.offAllNamed(
        AppRoutes.fillYourProfile,
        arguments: {'email': emailController.text},
      );
    } else if (res is ApiFailure<AuthSession>) {
      final raw = res.error.message;

      final errorCode = repo.extractErrorCode(raw);
      if (errorCode == 'user_already_exists') {
        errorText.value = 'auth_user_already_exists'.tr;
        AppSnackBar.info(errorText.value!);
        Get.offAllNamed(AppRoutes.login);
      } else {
        errorText.value = repo.extractMessage(raw);
        AppSnackBar.error('auth_unknown_error'.tr);
      }
    }

    isLoading.value = false;
  }

  Future<void> logout() async {
    await prefs.remove(PrefKeys.accessToken);
    await prefs.remove(PrefKeys.refreshToken);
    await prefs.remove(PrefKeys.expiresAt);
    await prefs.remove(PrefKeys.userId);
    await prefs.setBool(PrefKeys.isLoggedIn, false);

    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> _saveSession(AuthSession session) async {
    await prefs.setString(
      PrefKeys.accessToken,
      session.accessToken,
    );

    await prefs.setString(
      PrefKeys.refreshToken,
      session.refreshToken,
    );

    await prefs.setString(
      PrefKeys.userId,
      session.userId,
    );

    final expiresAt =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000) + session.expiresIn;

    await prefs.setInt(
      PrefKeys.expiresAt,
      expiresAt,
    );

    await prefs.setBool(
      PrefKeys.isLoggedIn,
      true,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (!(LoginFormKey.currentState?.validate() ?? false)) return;
    TextInput.finishAutofillContext();

    isLoading.value = true;
    errorText.value = null;

    final res = await repo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res is ApiSuccess<AuthSession>) {
      await _saveSession(res.data);
      Get.find<NavigationController>().unlockAfterLogin();
      Get.find<AuthGateService>().continueAfterLogin();
    } else if (res is ApiFailure<AuthSession>) {
      final raw = res.error.message;
      errorText.value = repo.extractMessage(raw);
      AppSnackBar.error(errorText.value!);
    }

    isLoading.value = false;
  }
}
