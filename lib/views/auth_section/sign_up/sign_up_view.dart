import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/utils/auth_validators.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../auth_controller/auth_controller.dart';
import '../sign_in/signIn_view/sign_in_view.dart';
import '../widgets/phone_field_widget.dart';
import '../widgets/socialButton.dart';
import 'package:country_picker/country_picker.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

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
                SizedBox(height: 40.h),

                // Title
                Text(
                  "create_account".tr,
                  style: CustomTextStyles.headline32Bold,
                ),
                SizedBox(height: 16.h),

                // Subtitle
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!"
                      .tr,
                  style: CustomTextStyles.subTitle
                      .copyWith(fontSize: 20, height: 1.5),
                ),
                SizedBox(height: 12.h),

                // Email
                CustomTextField(
                  controller: authController.emailController,
                  hint: "Email".tr,
                  keyboardType: TextInputType.emailAddress,
                  tfBackground: AppColors.textField2,
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 16.h),

                // Password
                CustomTextField(
                  controller: authController.passwordController,
                  hint: "Password".tr,
                  tfBackground: AppColors.textField2,
                  isPassword: true,
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 16.h),

                Obx(
                  () => PhoneFieldWidget(
                    country: authController.selectedCountry.value,
                    controller: authController.phoneController,
                    validator: (value) => Validators.validatePhone(
                        value, authController.selectedCountry),
                    onChanged: (value) {
                      authController.phoneController.text = value;
                    },
                    onTapCountry: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        onSelect: (country) {
                          authController.selectedCountry.value = country;
                          authController.signUpFormKey.currentState?.validate();
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 37.h),

                // Create Account Button
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: CustomPrimaryButton(
                      label: authController.isLoading.value
                          ? "Creating..."
                          : "Create Account",
                      onTap: () {
                        if (!authController.isLoading.value) {
                          if (authController.signUpFormKey.currentState
                                  ?.validate() ??
                              false) {
                            authController.signUp();
                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

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

                SizedBox(height: 24.h),

                // Social buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      imagePath: AppImages.google,
                      onTap: () {},
                    ),
                    SizedBox(width: 32.w),
                    SocialButton(
                      imagePath: AppImages.facebook,
                      onTap: () {},
                    ),
                    SizedBox(width: 32.w),
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

                    SizedBox(height: 40.h),

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
