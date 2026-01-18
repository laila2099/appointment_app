import 'dart:math';
import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';
import '../../../../../core/classes/utils/app_snackbar.dart';

class VerificationController extends GetxController {
  final codeLength = 4;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  var isCodeComplete = false.obs;
  var enteredCode = ''.obs;

  late String expectedCode;

  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());

    _generateOtpInternal();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _generateOtpInternal() {
    expectedCode = (1000 + Random().nextInt(9000)).toString();
    print("📌🟢 Debug OTP generated: $expectedCode");
  }

  void resendCode() {
    _generateOtpInternal();
    AppSnackBar.info("Debug OTP: $expectedCode");
    AppSnackBar.info('OTP code has been resent');
  }

  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < codeLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    enteredCode.value = controllers.map((e) => e.text).join();
    isCodeComplete.value = enteredCode.value.length == codeLength;
  }

  bool verifyCode() {
    if (enteredCode.value.length < codeLength) {
      AppSnackBar.error('Please enter the complete OTP code');
      return false;
    }

    if (enteredCode.value == expectedCode) {
      return true;
    } else {
      AppSnackBar.error('Invalid OTP');
      return false;
    }
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
