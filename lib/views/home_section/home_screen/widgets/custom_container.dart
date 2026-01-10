import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/home_section/find_nearby/views/find_nearby_screen.dart';
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: AppColors.primary,
          ),
          child: Stack(
            children: [
              Positioned(
                // top: 5.h,
                child: Image.asset(AppImages.rectangle),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 12.h),
                child: Column(
                  children: [
                    Text(
                      "Book and\nschedule with\nnearest doctor",
                      style: CustomTextStyles.container,
                    ),
                    SizedBox(height: 13.h),
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
          left: 200.w,
          top: -32.h,
          child: Image.asset(height: 197.h, width: 136.w, AppImages.nurse),
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
