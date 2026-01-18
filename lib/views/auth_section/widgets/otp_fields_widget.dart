import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../forgot_password/forgot_password_screens/controllers/otp_verification_controller.dart';

class OtpFields extends StatelessWidget {
  final VerificationController controller;

  const OtpFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controller.codeLength, (i) {
        return SizedBox(
          width: screenWidth * 0.15,
          height: screenHeight * 0.09,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextField(
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
                  fillColor: AppColors.textField2,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppColors.separator, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
                onChanged: (val) => controller.onChanged(val, i),
              ),
              Positioned(
                bottom: 27,
                child: IgnorePointer(
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: controller.controllers[i],
                    builder: (context, value, _) {
                      final isEmpty = value.text.isEmpty;

                      return AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: isEmpty ? 1 : 0,
                          child: Container(
                            width: 20.w,
                            height: 1.6.h,
                            color: AppColors.textField,
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
