import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../../core/utils/auth_validators.dart';
import '../../../../widgets/helpful_widgets/text_field_widget.dart';
import '../../auth_controller/auth_controller.dart';
import '../../widgets/phone_field_widget.dart';
import '../fill_your_profile_controller/fill_your_profile_controller.dart';
import 'package:country_picker/country_picker.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final autoProfileController = Get.find<AuthFillProfileController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
        padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),

                child: Form(
                  key: autoProfileController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

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
                              Get.offAllNamed('/home');
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
                                    color: AppColors.light2Grey,
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

                      // Full Name
                      CustomTextField(
                        controller: autoProfileController.fullNameController,
                      hint: "full_name".tr,
                        validator: Validators.validateFullName,

                      ),
                      const SizedBox(height: 16),

                      // Email
                      CustomTextField(
                        controller: autoProfileController.emailController,
                        hint: "Email".tr,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: 16),

                      // Birthday
                      GestureDetector(
                          onTap: () =>
                              autoProfileController.pickBirthday(context),
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller:
                                  autoProfileController.birthdateController,
                              hint: "Birthday",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your birthdate';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),

                      const SizedBox(height: 16),

                      //Phone Number
                      PhoneFieldWidget(
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
                              authController.signUpFormKey.currentState
                                  ?.validate();
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: CustomPrimaryButton(
                    label: autoProfileController.isLoading.value
                        ? "Saving..."
                        : "Submit",
                    onTap: autoProfileController.submitProfile,
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
