import 'package:appointment_app/views/settings_section/settings_view/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget switchTile({
  required String title,
  required RxBool value,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        CustomSwitch(value: value),
      ],
    ),
  );
}
