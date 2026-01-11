import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../widgets/helpful_widgets/text_field_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Title
              Text(
                "forgot_password".tr,
                style: CustomTextStyles.headline32Bold,
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                "validation_subtitle".tr,
                style: CustomTextStyles.subTitle,
              ),

              const SizedBox(height: 32),

              // Email or Phone
              CustomTextField(
                hint: 'email_phone'.tr,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // New Password
              CustomTextField(
                hint: 'new_password'.tr,
                keyboardType: TextInputType.visiblePassword,
              ),

              const SizedBox(height: 16),

              // Confirm New Password
              CustomTextField(
                hint: 'confirm_new_password'.tr,
                keyboardType: TextInputType.visiblePassword,
              ),

              const Spacer(),

              // Send Reset Link Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // إضافة عملية إعادة التعيين هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'reset_password'.tr,
                    style: CustomTextStyles.button,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
