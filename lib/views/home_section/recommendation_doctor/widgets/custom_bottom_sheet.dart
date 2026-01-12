import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/controllers/sort_controller.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/sort_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  final controller = Get.find<SortController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Sort By", style: CustomTextStyles.screenTitle),
                ),
                SizedBox(height: 16.h),
                Divider(color: AppColors.search),
                SizedBox(height: 24.h),
                Text("Speciality", style: CustomTextStyles.medium),
                SizedBox(height: 16.h),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.specialityList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: InkWell(
                            onTap: () => controller.selectSpeciality(index),
                            child: Obx(
                              () => SortChip(
                                active:
                                    controller.specialityIndex.value == index,
                                title: controller.specialityList[index].title,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                SizedBox(height: 24.h),
                Text("Rating", style: CustomTextStyles.medium),
                SizedBox(height: 16.h),
                Obx(() => SizedBox(
                      height: 45.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.ratingList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: GestureDetector(
                              onTap: () => controller.selectRating(index),
                              child: SortChip(
                                active: controller.ratingIndex.value == index,
                                title: controller.ratingList[index].title,
                                icon: controller.ratingList[index].icon,
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  controller.done();
                },
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
  }
}
