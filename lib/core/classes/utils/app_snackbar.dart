import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  AppSnackBar._();

  static void success(String messageKey) {
    Get.snackbar(
      'snackbar_success'.tr,
      messageKey.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }

  static void error(String messageKey) {
    Get.snackbar(
      'snackbar_error'.tr,
      messageKey.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }

  static void info(String messageKey) {
    Get.snackbar(
      'snackbar_info'.tr,
      messageKey.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueGrey.shade600,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}
