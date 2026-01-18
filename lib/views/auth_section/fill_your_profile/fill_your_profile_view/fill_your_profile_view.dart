import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../../core/utils/auth_validators.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/helpful_widgets/text_field_widget.dart';
import '../../auth_controller/auth_controller.dart';
import '../../widgets/phone_field_widget.dart';
import '../fill_your_profile_controller/fill_your_profile_controller.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Form(
                  key: autoProfileController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "fill_your_profile".tr,
                            style: CustomTextStyles.headline,
                          ),
                          GestureDetector(
                            onTap: () {
                              autoProfileController.saveProfile;
                              Get.offAllNamed(AppRoutes.bottomnavbar);
                            },
                            child: Text(
                              "skip".tr,
                              style: CustomTextStyles.subtitle.copyWith(
                                color: AppColors.primary,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Subtitle
                      Text(
                        "fill_profile_subtitle".tr,
                        style: CustomTextStyles.subTitle.copyWith(
                            fontSize: 14.sp,
                            height: 1.8.h,
                            letterSpacing: .5.sp),
                      ),
                      SizedBox(height: 32.h),

                      /// Profile Image
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 120.w,
                              height: 120.w,
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
                                  width: 36.w,
                                  height: 36.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.light2Grey,
                                    border: Border.all(
                                        color: Colors.white, width: 2.w),
                                  ),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Full Name
                      CustomTextField(
                        controller: autoProfileController.fullNameController,
                        hint: "full_name".tr,
                        validator: Validators.validateFullName,
                      ),
                      SizedBox(height: 16.h),

                      // Email
                      CustomTextField(
                        controller: autoProfileController.emailController,
                        hint: "Email".tr,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      SizedBox(height: 16.h),

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

                      SizedBox(height: 16.h),

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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: CustomPrimaryButton(
                    label: autoProfileController.isLoading.value
                        ? "Saving..."
                        : "Submit",
                    onTap: autoProfileController.saveProfile,
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
