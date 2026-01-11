import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';
import '../../../../../core/classes/utils/app_snackbar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/otp_fields_widget.dart';
import '../controllers/otp_verification_controller.dart';

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
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 24, vertical: 16),
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
                        "otp_verification".tr,
                        style: CustomTextStyles.headline32Bold,
                      ),
                      Text(
                        "otp_subtitle".tr,
                        style: CustomTextStyles.subTitle,
                      ),
                      const SizedBox(height: 16),
                      Text("otp_sent_to".tr),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        child: OtpFields(controller: verificationController),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "didnt_receive_code".tr,
                            style: CustomTextStyles.subTitle,
                          ),
                          TextButton(
                            onPressed: () =>
                                verificationController.resendCode(),
                            child: Text(
                              "resend".tr,
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
<<<<<<< HEAD:lib/views/auth_section/forgot_password/forgot_password_screens/otp_verification_view.dart
                label: "submit".tr,
                onTap: () {},
              ),
=======
                label: "Submit",
                onTap: () {
                  if (verificationController.verifyCode()) {
                    // استدعاء API للتحقق من OTP
                    AppSnackBar.success('OTP verified!');
                  }
                },
              )

>>>>>>> origin/zahraa:lib/views/auth_section/forgot_password/forgot_password_screens/views/otp_verification_view.dart
            ],
          ),
        ),
      ),
    );
  }
}
