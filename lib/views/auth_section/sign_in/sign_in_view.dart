import 'package:appointment_app/core/classes/repositories/auth_repository.dart';
import 'package:appointment_app/core/services/shared_prefrences.dart';
import 'package:appointment_app/views/auth_section/auth_controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../sign_up/sign_up_view.dart';
import '../widgets/socialButton.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthController controller = Get.put(
    AuthController(
      repo: Get.find<AuthRepository>(),
      prefs: Get.find<AppPreferencesService>(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: controller.LoginFormKey,
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),

                  // Title
                  Text(
                    "Welcome Back",
                    style: CustomTextStyles.headline32Bold,
                  ),
                  SizedBox(height: 16.h),

                  // Subtitle
                  Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: CustomTextStyles.subTitle,
                  ),
                  SizedBox(height: 32.h),

                  // Email
                  CustomTextField(
                    controller: controller.emailController,
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Password
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      hint: "Password",
                      isPassword: !controller.isPasswordVisible.value,
                      autofillHints: [AutofillHints.password],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Remember + Forgot
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value = value ?? false;
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: CustomTextStyles.subtitle12W500,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: CustomTextStyles.subtitle12W500
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Login Button
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: CustomPrimaryButton(
                        label: controller.isLoading.value
                            ? "Logging in..."
                            : "Login",
                        onTap: () {
                          if (!controller.isLoading.value) {
                            if (controller.LoginFormKey.currentState
                                    ?.validate() ??
                                false) {
                              controller.login();
                            }
                          }
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or sign in with",
                          style: CustomTextStyles.subtitle,
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        imagePath: AppImages.google,
                        onTap: () {},
                      ),
                      SizedBox(width: 16.w),
                      SocialButton(
                        imagePath: AppImages.facebook,
                        onTap: () {},
                      ),
                      SizedBox(width: 16.w),
                      SocialButton(
                        imagePath: AppImages.apple,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),

                  // Footer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: CustomTextStyles.subtitle,
                          children: [
                            const TextSpan(
                              text: "By logging, you agree to our ",
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: CustomTextStyles.subtitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            const TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: CustomTextStyles.subtitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: CustomTextStyles.subtitle,
                          children: [
                            const TextSpan(
                              text: "Don't have an account yet? ",
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: CustomTextStyles.subtitle.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const CreateAccountView());
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
