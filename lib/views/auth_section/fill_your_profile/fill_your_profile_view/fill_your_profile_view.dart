import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../../core/classes/repositories/profile_repository.dart';
import '../../../../core/services/image_picker_service.dart';
import '../../../../core/utils/auth_validators.dart';
import '../../../../widgets/general_widgets/pick_image_sheet.dart';
import '../../../../widgets/helpful_widgets/text_field_widget.dart';
import '../../../profile_section/profile_controller/profile_controller.dart';
import '../../auth_controller/auth_controller.dart';
import '../../widgets/phone_field_widget.dart';
import '../fill_your_profile_controller/fill_your_profile_controller.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final autoProfileController = Get.find<AuthFillProfileController>();
    final AuthController authController = Get.find<AuthController>();

    final profileController = Get.isRegistered<ProfileController>()
        ? Get.find<ProfileController>()
        : Get.put(ProfileController(
            repository: Get.find<ProfileRepository>(),
          ));

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
                            Obx(() {
                              final file = profileController.avatarFile.value;
                              return Container(
                                width: 120.w,
                                height: 120.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrey,
                                  image: DecorationImage(
                                    image: file != null
                                        ? FileImage(file)
                                        : const AssetImage(
                                                AppImages.personPhoto)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                            PositionedDirectional(
                              bottom: 0,
                              end: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  final src = await PickImageSheet.show();
                                  if (src == null) return;

                                  final picker = Get.find<ImagePickerService>();
                                  final file = await picker.pickImageFile(
                                      source: src, imageQuality: 85);

                                  if (file == null) return;

                                  // ✅ حفظ الصورة مؤقت + دائم
                                  profileController.setAvatar(file);
                                },
                                child: Container(
                                  width: 36.w,
                                  height: 36.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.light2Grey,
                                    border: Border.all(
                                        color: Colors.white, width: 2.w),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      AppIcons.edit,
                                      width: 21.w,
                                      height: 21.h,
                                      color: AppColors.primary,
                                    ),
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
                      Obx(
                        () => PhoneFieldWidget(
                          // ✅ التأكد أن الدولة تُقرأ من autoProfileController
                          country: autoProfileController.selectedCountry.value,
                          controller: TextEditingController.fromValue(
                            TextEditingValue(
                              text: autoProfileController.phoneRx.value,
                              selection: TextSelection.collapsed(
                                  offset: autoProfileController
                                      .phoneRx.value.length),
                            ),
                          ),
                          validator: (value) => Validators.validatePhone(
                              value,
                              autoProfileController
                                  .selectedCountry), // ✅ تأكدي أنها autoProfileController
                          onChanged: (value) {
                            autoProfileController.phoneRx.value = value;
                          },
                          onTapCountry: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              onSelect: (country) {
                                // ✅ تحديث autoProfileController وليس authController
                                autoProfileController.selectedCountry.value =
                                    country;
                              },
                            );
                          },
                        ),
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
