import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/app_images.dart';
import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:appoitment_app/views/profile_section/profile_controller/personal_info_controller.dart';
import 'package:appoitment_app/views/profile_section/profile_view/widgets/personal_info/personal_text_field.dart';
import 'package:appoitment_app/views/profile_section/profile_view/widgets/personal_info/phone_text_field.dart';
import 'package:appoitment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appoitment_app/widgets/general_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({Key? key}) : super(key: key);

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
              leading: IconButton(
                icon:  Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back(),
              ),
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
                  Obx(() => PersonalTextField(text: controller.name.value)),
                  SizedBox(
                    height: 16.h,
                  ),
                  Obx(() => PersonalTextField(text: controller.email.value)),
                  SizedBox(
                    height: 16.h,
                  ),
                  Obx(() => PersonalTextField(text: controller.password.value)),
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
                        Get.back();
                      }),
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
