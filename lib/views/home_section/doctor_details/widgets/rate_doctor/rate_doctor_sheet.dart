import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/app_colors.dart';
import 'rate_doctor_controller.dart';

class RateDoctorSheet extends StatelessWidget {
  const RateDoctorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(RateDoctorController(), permanent: false);

    return SafeArea(
      child: Container(
        height: 420.h,
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.12),
              blurRadius: 28,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.10),
                borderRadius: BorderRadius.circular(999.r),
              ),
            ),
            SizedBox(height: 14.h),

            Text(
              'give_rate'.tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 14.h),
            Divider(color: Colors.black.withOpacity(.06), height: 1),
            SizedBox(height: 18.h),

            // stars
            Obx(() {
              final r = c.rating.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (i) {
                  final index = i + 1;
                  final filled = index <= r;
                  return IconButton(
                    onPressed: () => c.setRating(index),
                    iconSize: 34.sp,
                    splashRadius: 22.r,
                    icon: Icon(
                      Icons.star_rounded,
                      color: filled
                          ? const Color(0xFFFFC107)
                          : Colors.grey.withOpacity(.45),
                    ),
                  );
                }),
              );
            }),

            SizedBox(height: 8.h),

            Text(
              'share_feedback'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16.h),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F7F9),
                borderRadius: BorderRadius.circular(14.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: TextField(
                controller: c.review,
                maxLines: 5,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'your_review'.tr,
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black.withOpacity(.35),
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 18.h),

            // done button
            Obx(() {
              final enabled = c.canSubmit;
              return SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: enabled
                      ? () {
                          // هون لاحقاً بتعملي API call
                          // c.rating.value
                          // c.review.text

                          Get.back(); // close bottom sheet
                          Get.delete<RateDoctorController>(force: true);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary.withOpacity(.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'done'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
