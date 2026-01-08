import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../auth_controller/auth_controller.dart';
import '../sign_in/sign_in_view.dart';
import '../widgets/phone_field_widget.dart';
import '../widgets/socialButton.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: auth.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Title
                Text(
                  "Create Account",
                  style: CustomTextStyles.headline32Bold,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  "Sign up now and start exploring all that our app has to offer.",
                  style: CustomTextStyles.subTitle,
                ),

                const SizedBox(height: 32),

                // Email
                CustomTextField(
                  controller: auth.emailController,
                  hint: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                // Password
                CustomTextField(
                  controller: auth.passwordController,
                  hint: "Password",
                  isPassword: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),

                const SizedBox(height: 16),

                // Phone number
                PhoneFieldWidget(
                  initialCountryCode: 'SA',
                  onChanged: (value) {
                    print(value);
                  },
                ),

                const SizedBox(height: 24),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: CustomPrimaryButton(
                    label: "Create Account",
                    onTap: auth.isLoading.value ? () {} : () => auth.signUp(),
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
                        "Or sign up with",
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
                  children: [
                    /// Terms
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: CustomTextStyles.subtitle,
                        children: [
                          const TextSpan(
                              text: "By signing up, you agree to our "),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: CustomTextStyles.subtitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          const TextSpan(text: " and "),
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

                    // Back to Login
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: CustomTextStyles.subtitle,
                        children: [
                          const TextSpan(
                            text: "Already have an account? ",
                          ),
                          TextSpan(
                            text: "Login",
                            style: CustomTextStyles.subtitle.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.off(() => LoginView());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
