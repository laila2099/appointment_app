import 'package:app_appointment/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String title;

  const CategoryItem({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF5F9FF),
          ),
          child: Center(
            child: SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
          ),
        ),

        SizedBox(height: 12.h),

        Text(
          title,
          style: CustomTextStyles.specialitytext,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
