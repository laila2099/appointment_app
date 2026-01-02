import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/controllers/sort_controller.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/sort_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});
  final sortcontroller = Get.put(SortController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SortController>(
      init: SortController(),
      builder: (controller) {
        return Container(
          height: 500.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(31.r),
              topRight: Radius.circular(31.r),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 8.h),

              /// Drag Handle
              Container(
                width: 60.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.search,
                  borderRadius: BorderRadius.circular(9.r),
                ),
              ),
              SizedBox(height: 30.h),

              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sort By",
                        style: CustomTextStyles.screenTitle,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Divider(color: AppColors.search),
                    SizedBox(height: 24.h),
                    Text("Speciality", style: CustomTextStyles.medium),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 45.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.specialityList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.selectSpeciality(index),
                                child: SortChip(
                                  active: controller.specialityIndex == index,
                                  title: controller.specialityList[index].title,
                                ),
                              ),
                              SizedBox(width: 25.w),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text("Rating", style: CustomTextStyles.medium),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 45.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.ratingList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.selectRating(index),
                                child: SortChip(
                                  active: controller.ratingIndex == index,
                                  title: controller.ratingList[index].title,
                                  icon: controller.ratingList[index].icon,
                                ),
                              ),
                              SizedBox(width: 25.w),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                child: SizedBox(
                  width: 327.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text("Done", style: CustomTextStyles.button),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
