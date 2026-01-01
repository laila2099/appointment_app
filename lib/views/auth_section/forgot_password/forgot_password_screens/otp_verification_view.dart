import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../widgets/otp_fields_widget.dart';
import '../verification_controller/verification_controller.dart';

class OtpVerificationView extends StatelessWidget {
  OtpVerificationView({super.key});
  final verificationController = Get.put(VerificationController());
  // final createAccountController = Get.find<SignupController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        "OTP Verification",
                        style: CustomTextStyles.headline32Bold,
                      ),
                      Text(
                        "Add a PIN number to make your account more secure and easy to sign in.",
                        style: CustomTextStyles.subTitle,
                      ),
                      const SizedBox(height: 16),
                      Text('We have sent a verification code to'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: OtpFields(controller: verificationController),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive the code?",
                            style: CustomTextStyles.subTitle,
                          ),
                          TextButton(
                            onPressed: () =>
                                verificationController.resendCode(),
                            child: Text(
                              "Resend",
                              style: CustomTextStyles.subTitle,
                              selectionColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // الزر ثابت في أسفل الشاشة
              CustomPrimaryButton(
                label: "Submit",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
