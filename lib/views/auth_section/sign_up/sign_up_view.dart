import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../auth_controller/auth_controller.dart';
import '../sign_in/signIn_view/sign_in_view.dart';
import '../widgets/phone_field_widget.dart';
import '../widgets/socialButton.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 24, vertical: 16),
          child: Form(
            key: authController.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Title
                Text(
                  "create_account".tr,
                  style: CustomTextStyles.headline32Bold,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  "signup_subtitle".tr,
                  style: CustomTextStyles.subTitle,
                ),

                const SizedBox(height: 32),

                // Email
                CustomTextField(
                  controller: auth.emailController,
                  hint: "email".tr,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                // Password
                CustomTextField(
                  controller: auth.passwordController,
                  hint: "password".tr,
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
// <<<<<<< HEAD
//                 SizedBox(
//                   width: double.infinity,
//                   height: 52,
//                   child: CustomPrimaryButton(
//                     label: "create_account".tr,
//                     onTap: auth.isLoading.value ? () {} : () => auth.signUp(),
//                   ),
// =======
                CustomPrimaryButton(
                  label:
                      auth.isLoading.value ? "Creating..." : "Create Account",
                  onTap: () {
                    if (!auth.isLoading.value) {
                      if (auth.signUpFormKey.currentState?.validate() ??
                          false) {
                        auth.signUp();
                      }
                    }
                  },
                ),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 8),
                      child: Text(
                        "or_sign_up_with".tr,
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
                          TextSpan(text: "signup_terms_prefix".tr),
                          TextSpan(
                            text: "terms_conditions".tr,
                            style: CustomTextStyles.subtitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(text: " and ".tr),
                          TextSpan(
                            text: "privacy_policy".tr,
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
                          TextSpan(
                            text: "already_have_account".tr,
                          ),
                          TextSpan(
                            text: "login".tr,
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
