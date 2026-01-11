import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../profile_controller/personal_info_controller.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonalInfoController>();

    return Container(
      width: 345.w,
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFF),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: const Color(0xffEEEEEE)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: controller.onCountrySelected,
              );
            },
            child: Obx(() => Row(
                  children: [
                    Text(
                      controller.selectedCountry.value.flagEmoji,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.keyboard_arrow_down, size: 18.sp),
                  ],
                )),
          ),

          /// Divider
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
            width: 1.2.w,
            height: 18.h,
            color: Colors.grey.shade200,
          ),

          /// Phone Number
          Expanded(
            child: Obx(() => Text(
                  '+${controller.selectedCountry.value.phoneCode} ${controller.phoneController.text.isEmpty ? "938756 878" : controller.phoneController.text}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF242424),
                  ),
                  overflow: TextOverflow.ellipsis,
                )),
          ),
        ],
      ),
    );
  }
}
