import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constant/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const SearchTextField({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: TextStyle(fontSize: 14.sp, color: AppColors.black),
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.search,
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.lightGrey,
                ),
              ),
              hintStyle: TextStyle(fontSize: 13.sp, color: AppColors.subtitle),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 14.w,
              ),
              filled: true,
              fillColor: Color(0xfff2f4f7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }
}
