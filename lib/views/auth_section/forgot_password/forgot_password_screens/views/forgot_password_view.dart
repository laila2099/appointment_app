import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';
import '../../../../../core/classes/utils/app_snackbar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../core/utils/auth_validators.dart';
import '../../../../../widgets/helpful_widgets/text_field_widget.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final controller = Get.put(ForgotPasswordController(
    repo: Get.find(),
    prefs: Get.find(),
  ));

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

              /// Title
              Text(
                'Forgot Password',
                style: CustomTextStyles.headline32Bold,
              ),

              const SizedBox(height: 16),

              /// Subtitle
              Text(
                'At our app, we take the security of your information seriously.',
                style: CustomTextStyles.subTitle,
              ),

              const SizedBox(height: 32),

              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    /// Email or Phone
                    CustomTextField(
                      controller: controller.emailController,
                      hint: 'Email or Phone Number',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email or phone';
                        }
                        if (value.contains('@')) {
                          return Validators.validateEmail(value);
                        }
                        // إضافة تحقق من رقم الهاتف إذا أردت
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    /// New Password
                    CustomTextField(
                      controller: controller.newPasswordController,
                      hint: 'New Password',
                      isPassword: !controller.isPasswordVisible.value, // هذا ثابت عند البناء
                      suffixIcon: Obx(() => IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                        },
                      )),
                      validator: Validators.validatePassword,
                    ),

                    const SizedBox(height: 16),

                    /// Confirm New Password
                    Obx(() => CustomTextField(
                      controller: controller.confirmPasswordController,
                      hint: 'Confirm New Password',
                      isPassword: !controller.isConfirmPasswordVisible.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isConfirmPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.isConfirmPasswordVisible.value =
                          !controller.isConfirmPasswordVisible.value;
                        },
                      ),
                      validator: (value) => Validators.validateConfirmPassword(
                          value, controller.newPasswordController.text),
                    )),
                  ],
                ),
              ),

              const Spacer(),

              /// Send Reset Link Button
              Obx(() => SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.resetPassword();
                    } else {
                      AppSnackBar.error('Please fix the errors in the form');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : Text(
                    'Reset Password',
                    style: CustomTextStyles.button,
                  ),
                ),
              )),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
