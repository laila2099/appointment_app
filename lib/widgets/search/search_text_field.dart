import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchTextField({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: AppColors.subtitle,
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 14.w,
              ),
              filled: true,
              fillColor: AppColors.search,
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
