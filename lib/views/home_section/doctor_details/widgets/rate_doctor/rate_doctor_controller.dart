import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateDoctorController extends GetxController {
  final rating = 0.obs; // 1..5
  final review = TextEditingController();

  void setRating(int v) => rating.value = v;

  bool get canSubmit => rating.value > 0;

  @override
  void onClose() {
    review.dispose();
    super.onClose();
  }
}
