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

    return CustomTextField(
      hint: '',
      controller: controller.phoneController,
      keyboardType: TextInputType.phone,
      textStyle: TextStyle(color: AppColors.black),
      prefixIcon: InkWell(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: controller.onCountrySelected,
          );
        },
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 12.w),
              Text(
                controller.selectedCountry.value.flagEmoji,
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(width: 4.w),
              Icon(Icons.keyboard_arrow_down, size: 18.sp),
              SizedBox(width: 8.w),
              Container(
                width: 1,
                height: 24.h,
                color: Colors.grey.shade300,
              ),
              SizedBox(width: 12.w),
            ],
          ),
        ),
      ),
    );
  }
}
