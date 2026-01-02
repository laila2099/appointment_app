import 'package:flutter/material.dart' hide TextField;
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Title
              Text(
                'Forgot Password',
                style: CustomTextStyles.headline32Bold,
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                'At our app, we take the security of your information seriously.',
                style: CustomTextStyles.subTitle,
              ),

              const SizedBox(height: 32),

              // Email or Phone
              CustomTextField(
                hint: 'Email or Phone Number',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // New Password
              CustomTextField(
                hint: 'New Password',
                keyboardType: TextInputType.visiblePassword,
              ),

              const SizedBox(height: 16),

              // Confirm New Password
              CustomTextField(
                hint: 'Confirm New Password',
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
                    'Reset Password',
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
