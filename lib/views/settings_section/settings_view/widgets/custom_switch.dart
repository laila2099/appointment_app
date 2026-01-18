import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  final RxBool value;

  const CustomSwitch({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterSwitch(
        value: value.value,
        onToggle: (val) => value.value = val,
        width: 36,
        height: 18,
        toggleSize: 14,
        borderRadius: 14,
        padding: 2,
        activeColor: AppColors.primary,
        inactiveColor: Colors.grey.shade300,
        activeToggleColor: AppColors.white,
        inactiveToggleColor: AppColors.white,
        switchBorder: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        toggleBorder: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        duration: Duration(milliseconds: 300),
      ),
    );
  }
}
