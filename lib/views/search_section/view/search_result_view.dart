import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_icons.dart';
import '../../../widgets/doctor_card.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../controller/search_result_controller.dart';
import '../widget/custom_tab.dart';
import '../widget/sort_by_bottom_sheet.dart'; // استدعاء البوتوم شيت

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchResultController>();

    final List<String> allTabs = ['All', 'General', 'Neurologic', 'Pediatric'];
    final selectedTab = ''.obs;

    return Scaffold(
      backgroundColor: AppColors.white,
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
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    // onChanged: (value) {
                    //   searchController.searchDoctors(value);
                    // },
                  ),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r)),
                      ),
                      builder: (context) => const SortByBottomSheet(),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppIcons.sort,
                      width: 24.w,
                      height: 24.h,
                    ),
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

            // Tabs
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: allTabs.map((tab) {
                    return CustomTab(
                      label: tab,
                      isSelected: selectedTab.value == tab,
                      onTap: () {
                        selectedTab.value = tab;
                      },
                      isSmall: true,
                    );
                  }).toList(),
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Obx(() {
              int count = searchController.doctorsList.length;
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 4.h),
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
}
