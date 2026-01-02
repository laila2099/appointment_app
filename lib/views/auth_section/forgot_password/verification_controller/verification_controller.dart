import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final int codeLength = 4;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void onInit() {
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes.first.requestFocus();
    });
  }

  String get enteredCode => controllers.map((c) => c.text).join();

  void onChanged(String value, int index) {
    final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (filtered.isNotEmpty) {
      final chars = filtered.characters.toList();
      for (int i = 0; i < chars.length && index + i < codeLength; i++) {
        controllers[index + i].text = chars[i];
      }
      final nextIndex = index + chars.length;
      if (nextIndex < codeLength) {
        focusNodes[nextIndex].requestFocus();
      } else {
        focusNodes[codeLength - 1].unfocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
    update();
  }

  void submit() {
    if (enteredCode.length < codeLength) {
      Get.snackbar(
        'Error',
        'Please enter the full code',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
  }
  void resendCode() {
    Get.snackbar(
      'Info',
      'Verification code resent',
      snackPosition: SnackPosition.TOP,
    );
  }
}
