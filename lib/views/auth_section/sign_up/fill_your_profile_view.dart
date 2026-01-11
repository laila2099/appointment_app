import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../auth_controller/fill_your_profile_controller.dart';
import '../widgets/phone_field_widget.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<AuthFillProfileController>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 24, vertical: 16),
                child: Form(
                  key: profileController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      // عنوان + زر Skip ضمن نفس السطر
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "fill_your_profile".tr,
                            style: CustomTextStyles.headline32Bold,
                          ),
                          GestureDetector(
                            onTap: () {
                              // الانتقال لصفحة الهوم
                              // Get.toNamed(AppRoutes.home);
                            },
                            child: Text(
                              "skip".tr,
                              style: CustomTextStyles.subtitle.copyWith(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Subtitle
                      Text(
                        "fill_profile_subtitle".tr,
                        style: CustomTextStyles.subtitle,
                      ),
                      const SizedBox(height: 32),

                      /// Profile Image
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightGrey,
                                image: const DecorationImage(
                                  image: AssetImage(AppImages.personPhoto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              bottom: 0,
                              end: 0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.textField,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      CustomTextField(
                        controller: profileController.fullNameController,
                        hint: "full_name".tr,
                      ),
                      const SizedBox(height: 16),

                      // Email
                      CustomTextField(
                        controller: profileController.emailController,
                        hint: "email".tr,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      // Password
                      // const CustomTextField(
                      //   hint: "Password",
                      //   isPassword: true,
                      // ),
                      // const SizedBox(height: 16),

                      // Birthday
                      CustomTextField(
                        controller: profileController.birthdateController,
                        hint: "birthday".tr,
                      ),
                      const SizedBox(height: 16),

                      // Phone
                      PhoneFieldWidget(
                        initialCountryCode: 'SA',
                        onChanged: (value) {
                          profileController.phoneRx.value = value;
                        },
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            // الزر ثابت أسفل الشاشة
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: CustomPrimaryButton(
                  label: "submit".tr,
                  onTap: () {
                    profileController.setProfile();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
