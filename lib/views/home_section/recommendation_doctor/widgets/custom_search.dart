import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

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

          IconButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              Get.bottomSheet(CustomBottomSheet());
            },
            icon: Icon(Icons.filter_list, size: 24.sp),
          ),
        ],
      ),
    );
  }
}
