import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget switchTile({
  required String title,
  required RxBool value,
}) {
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Obx(
          () => Transform.scale(
            scale: 0.7,
            
            child: Switch.adaptive(
              value: value.value,
              onChanged: (val) => value.value = val,
              activeThumbColor: AppColors.white,
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Colors.grey.shade300,
              inactiveThumbColor: Colors.white,
             // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

            ),
          ),
        ),
      ],
    ),
  );
}


