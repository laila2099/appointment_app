import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_icons.dart';
import '../../../core/constant/text_style.dart';
import '../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../widgets/general_widgets/primary_button.dart';
import '../settings_controller/language_controller.dart';
import 'widgets/language_item.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              // onBack: Get.back,
              center: Text(
                "language".tr,
                style: CustomTextStyles.screenTitle,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
              child: Container(
                width: 343.w,
                height: 56.h,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F7),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.search,
                      width: 20.sp,
                      height: 20.sp,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF9E9E9E),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        onChanged: controller.searchLanguage,
                        decoration: InputDecoration(
                          hintText: 'search'.tr,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF9E9E9E),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsetsDirectional.zero,
                        ),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                  itemCount: controller.languages.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  itemBuilder: (context, index) {
                    final lang = controller.languages[index];
                    return Obx(
                      () => LanguageItem(
                        title: lang.name,
                        isSelected: controller.selectedCode.value == lang.code,
                        onTap: () => controller.selectLanguage(lang.code),
                      ),
                    );
                  },
                ),
              ),
            ),
            PrimaryButton(
              text: "save".tr,
              onPressed: () {
                controller.applyLanguage();
                Get.back();
              },
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
            ),
          ],
        ),
      ),
    );
  }
}
