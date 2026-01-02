import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({super.key, required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: TextFormField(
                cursorColor: AppColors.primary,
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 46.w,
            height: 46.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: IconButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onTap,
              icon: SvgPicture.asset(icon, width: 24.w, height: 24.h),
              // icon: Icon(icon, size: 24.sp),
            ),
          ),
        ],
      ),
    );
  }
}
