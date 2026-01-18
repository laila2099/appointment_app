import 'package:appointment_app/core/constant/app_keys.dart';
import 'package:appointment_app/core/services/auth_gate_service.dart';
import 'package:appointment_app/core/services/shared_prefrences.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                        style: CustomTextStyles.custom(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      const SizedBox(height: 8),
                      Text("otp_subtitle".tr,
                          style:
                              CustomTextStyles.subTitle.copyWith(height: 1.8)),
                      const SizedBox(height: 16),
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
                    ],
                  ),
                ),
              ),

              // الزر ثابت في أسفل الشاشة
              CustomPrimaryButton(
                label: "Submit",
                onTap: () async {
                  if (verificationController.verifyCode()) {
                    // 1. حفظ حالة الدخول فوراً
                    final prefs = Get.find<AppPreferencesService>();
                    await prefs.setBool(PrefKeys.isLoggedIn, true);
                    await prefs.setBool(PrefKeys.isVerified, true);

                    AppSnackBar.success('OTP verified!');

                    Get.find<NavigationController>().unlockAfterLogin();
                    Get.offAllNamed(AppRoutes.bottomnavbar);

                    Get.find<AuthGateService>().clearPending();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
