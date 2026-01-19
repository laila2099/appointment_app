import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/services/image_picker_service.dart';
import '../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../widgets/general_widgets/pick_image_sheet.dart';
import '../../../widgets/general_widgets/primary_button.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../profile_controller/personal_info_controller.dart';
import '../profile_controller/profile_controller.dart';
import 'widgets/personal_info/phone_text_field.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final PersonalInfoController controller =
        Get.find<PersonalInfoController>();
    final ProfileController profileController = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppHeader(
              onBack: Get.back,
              center: Text(
                "personal_information".tr,
                style: CustomTextStyles.screenTitle,
              ),
            ),

            SizedBox(height: 46.h),

            /// Avatar
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Obx(() {
                    final file = profileController.avatarFile.value;
                    return CircleAvatar(
                      radius: 60.r,
                      backgroundImage: file != null
                          ? FileImage(file)
                          : AssetImage(AppImages.avatar) as ImageProvider,
                    );
                  }),
                  GestureDetector(
                    onTap: () async {
                      final src = await PickImageSheet.show();
                      if (src == null) return;

                      final picker = Get.find<ImagePickerService>();
                      final file = await picker.pickImageFile(
                          source: src, imageQuality: 85);

                      if (file == null) return;

                      profileController.setAvatar(file);
                    },
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF8F8F8),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.edit,
                        width: 21.w,
                        height: 21.h,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 52.h),

            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
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
                    readOnly: true,
                    textStyle: TextStyle(color: AppColors.black),
                    onTap: controller.pickBirthday,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const PhoneTextField(),
                  SizedBox(height: 24.h),
                  Text(
                    "personal_info_warning".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF757575),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  PrimaryButton(
                    text: "save".tr,
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
