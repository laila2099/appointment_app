import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../forgot_password/forgot_password_screens/forgot_password_view.dart';
import '../sign_up/sign_up_view.dart';
import '../widgets/socialButton.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Title
              Text(
                "Welcome Back",
                style: CustomTextStyles.headline32Bold,
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: CustomTextStyles.subTitle,
              ),

              const SizedBox(height: 32),

              // Email
              CustomTextField(
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // Password
              CustomTextField(
                hint: "Password",
                isPassword: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: 16),

              // Remember + Forgot
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColors.primary,
                  ),
                  Text(
                    "Remember me",
                    style: CustomTextStyles.subtitle12W500,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(ForgotPasswordView());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: CustomTextStyles.subtitle12W500.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: CustomPrimaryButton(
                  label: "Login",
                  onTap: () {
                    Get.offAllNamed(AppRoutes.bottomnavbar);
                  },
                ),
              ),

              const SizedBox(height: 24),

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

              const SizedBox(height: 24),

              // Social buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    imagePath: AppImages.google,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialButton(
                    imagePath: AppImages.facebook,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialButton(
                    imagePath: AppImages.apple,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Footer
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Terms & Privacy
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

                  const SizedBox(height: 16),

                  // Sign up
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
                  )
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
