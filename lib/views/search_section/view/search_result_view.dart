import 'package:appointment_app/widgets/search/search_text_field.dart';
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
                Expanded(child: SearchTextField()),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (_) {
                        return const SortByBottomSheet();
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
