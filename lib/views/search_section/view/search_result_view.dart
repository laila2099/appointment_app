import 'package:appointment_app/views/home_section/recommendation_doctor/controllers/sort_controller.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/custom_bottom_sheet.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/sort_chip.dart';
import 'package:appointment_app/widgets/search/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/doctor_card.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../controller/search_result_controller.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchResultController>();
    final controller = Get.find<SortController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titel: 'search'.tr,
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SearchTextField()),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (_) {
                        return CustomBottomSheet();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.filter_list,
                    color: AppColors.black,
                    size: 24.w,
                  ),
                ),
                SizedBox(width: 12.w),
              ],
            ),

            SizedBox(height: 12.h),

            // Tabs
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
            SizedBox(height: 12.h),

            Obx(() {
              int count = searchController.doctorsList.length;
              return Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.symmetric(vertical: 4.h),
                child: Text(
                  "$count founds",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              );
            }),

            SizedBox(height: 12.h),

            Expanded(
              child: Obx(() {
                var doctorList = searchController.doctorsList;
                if (doctorList.isEmpty) {
                  return Center(
                    child: Text(
                      "no_doctors_found".tr,
                      style: TextStyle(color: AppColors.subtitle),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: doctorList.length,
                  itemBuilder: (context, index) {
                    final doctor = doctorList[index];
                    return DoctorCard(
                      image: doctor.image,
                      name: doctor.name,
                      department: doctor.department,
                      hospital: doctor.hospital,
                      rating: doctor.rating,
                      reviews: doctor.reviews,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
