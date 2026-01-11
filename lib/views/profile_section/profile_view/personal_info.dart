import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../widgets/general_widgets/primary_button.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../profile_controller/personal_info_controller.dart';
import 'widgets/personal_info/phone_text_field.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonalInfoController controller =
        Get.find<PersonalInfoController>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppHeader(
              center: Text(
                "Personal information",
                style: CustomTextStyles.screenTitle,
              ),
            ),

            SizedBox(height: 46.h),

            /// Avatar
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.white,
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(AppImages.avatar),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF8F8F8),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 52.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  CustomTextField(
                    hint: 'Full Name',
                    controller: controller.nameController,
                    textStyle: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hint: 'Email',
                    controller: controller.emailController,
                    textStyle: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hint: 'Birthdate',
                    controller: controller.birthdateController,
                    textStyle: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const PhoneTextField(),
                  SizedBox(height: 24.h),
                  Text(
                    "When you set up your personal information settings, "
                    "you should take care to provide accurate information.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF757575),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  PrimaryButton(
                    text: "Save",
                    onPressed: () {
                      controller.onSave();
                      Get.back();
                    },
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
