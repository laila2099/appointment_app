import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/app_colors.dart';
import '../forgot_password/verification_controller/verification_controller.dart';


class OtpFields extends StatelessWidget {
  final VerificationController controller;

  const OtpFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controller.codeLength, (i) {
        final isFilled = controller.controllers[i].text.isNotEmpty;

        return SizedBox(
          width: screenWidth * 0.15,
          height: screenHeight * 0.08,
          child: TextField(
            controller: controller.controllers[i],
            focusNode: controller.focusNodes[i],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor:
              isFilled ? AppColors.textField : AppColors.light2Grey,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.infoText, width: .1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            onChanged: (val) => controller.onChanged(val, i),
          ),
        );
      }),
    );
  }
}