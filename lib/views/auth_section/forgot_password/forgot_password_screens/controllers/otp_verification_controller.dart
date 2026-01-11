import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/classes/utils/app_snackbar.dart';

class VerificationController extends GetxController {
  final codeLength = 4; // عدد خانات OTP
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  var isCodeComplete = false.obs;
  var enteredCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  /// يستدعى عند تغيّر أي خانة
  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < codeLength - 1) {
      focusNodes[index + 1].requestFocus();    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();    }
    enteredCode.value = controllers.map((e) => e.text).join();
    isCodeComplete.value = enteredCode.value.length == codeLength;
  }

  /// إعادة إرسال الكود
  void resendCode() {
    // هنا يمكنك استدعاء API لإعادة إرسال الكود
    AppSnackBar.info('OTP code has been resent');
  }

  /// تحقق من صحة الكود قبل الإرسال
  bool verifyCode() {
    if (enteredCode.value.length < codeLength) {
      AppSnackBar.error('Please enter the complete OTP code');
      return false;
    }

    // هنا يمكن ربط API للتحقق من الكود
    AppSnackBar.success('OTP verified!');
    return true;
  }

  @override
  void onClose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
