import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/doctor_card.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../controller/search_result_controller.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchResultController>();

    final List<String> allTabs = ['All', 'General', 'Neurologic', 'Pediatric'];

    final selectedTab = ''.obs;

    return Scaffold(
      appBar: CustomAppBar(
        titel: 'Search',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: 'Search for doctors...',
                    controller: searchController.searchController,
                    prefixIcon: Icon(Icons.search, color: AppColors.primary),
                    onChanged: (value) {
                      searchController.searchDoctors(value);
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18.w,
                      height: 3.h,
                      color: AppColors.black,
                      margin: EdgeInsets.only(bottom: 2.h),
                    ),
                    Container(
                      width: 12.w,
                      height: 3.h,
                      color: AppColors.black,
                      margin: EdgeInsets.only(bottom: 2.h),
                    ),
                    Container(
                      width: 6.w,
                      height: 3.h,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: allTabs.map((tab) {
                      return _buildTab(
                        label: tab,
                        isSelected: selectedTab.value == tab,
                        onTap: () {
                          selectedTab.value = tab;
                        },
                        isSmall: true,
                      );
                    }).toList(),
                  ),
                )),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                var doctorList = searchController.doctorsList;
                if (doctorList.isEmpty) {
                  return Center(
                    child: Text(
                      "No doctors found",
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

  Widget _buildTab({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool isSmall = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30.r),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: isSmall ? 12.w : 20.w,
              vertical: isSmall ? 6.h : 12.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.secondBlue,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: AppColors.primary, width: 1.5.w),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.primary,
              fontSize: isSmall ? 14.sp : 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
