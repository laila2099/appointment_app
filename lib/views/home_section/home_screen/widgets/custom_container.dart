import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/core/constant/app_images.dart';
import 'package:app_appointment/core/constant/text_style.dart';
import 'package:app_appointment/views/home_section/find_nearby/views/find_nearby_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 345.w,
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.primary,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 12.h),
                child: Column(
                  children: [
                    Text(
                      "Book and\nschedule with\nnearest doctor",
                      style: CustomTextStyles.container,
                    ),
                    SizedBox(height: 15.h),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(FindNearbyScreen());
                      },
                      child: Text(
                        "Find Nearby",
                        style: CustomTextStyles.regular,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.w),
            ],
          ),
        ),
        Positioned(
          left: 190.w,
          top: -55.h,
          child: Image.asset(height: 250.h, width: 150.w, AppImages.nurse),
        ),
        Positioned(
          left: 230.w,
          top: 70.h,
          child: Image.asset(AppImages.rectangle),
        ),
      ],
    );
  }
}
