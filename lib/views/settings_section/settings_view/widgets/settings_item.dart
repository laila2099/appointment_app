import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget settingItem({
  String? icon,
  required String title,
  Color color = AppColors.black,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          icon != null
              ? SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                )
              : const SizedBox.shrink(),
          icon != null ? const SizedBox(width: 16) : const SizedBox.shrink(),
          Expanded(
            child: Text(title,
                style: CustomTextStyles.body14.copyWith(color: color)),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.black,
          ),
        ],
      ),
    ),
  );
}
