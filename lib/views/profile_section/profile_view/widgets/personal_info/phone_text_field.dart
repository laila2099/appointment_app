import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../widgets/helpful_widgets/text_field_widget.dart';
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
            child: CustomTextField(
              controller: controller.phoneController,
              hint: '938756 878',
              keyboardType: TextInputType.phone,
              border: InputBorder.none,
              textStyle: TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
