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
    final searchResultController = Get.find<SearchResultController>();
    final sortController = Get.find<SortController>();

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
              children: [
                Expanded(
                  child: SearchTextField(
                    hintText: searchResultController.lastQuery,
                    onSubmitted: (value) {
                      searchResultController.fetchDoctors(query: value);
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (_) => CustomBottomSheet(),
                    );
                  },
                  icon: Icon(Icons.filter_list,
                      color: AppColors.black, size: 24.w),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 45.h,
              child: Obx(() => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sortController.specialityList.length,
                    itemBuilder: (context, index) {
                      final category = sortController.specialityList[index];
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 15.w),
                        child: Obx(() => GestureDetector(
                              onTap: () {
                                sortController.selectSpeciality(index);
                                searchResultController.fetchDoctors(
                                    categoryId: (category.title == 'general')
                                        ? null
                                        : category.id.toString());
                              },
                              child: SortChip(
                                active: sortController.specialityIndex.value ==
                                    index,
                                title: category.title,
                              ),
                            )),
                      );
                    },
                  )),
            ),
            SizedBox(height: 12.h),
            Obx(() {
              if (searchResultController.isLoading.value) {
                return const SizedBox.shrink();
              }
              return Text(
                "${searchResultController.doctorsList.length} founds",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 12.h),
            Expanded(
              child: Obx(() {
                if (searchResultController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (searchResultController.doctorsList.isEmpty) {
                  return Center(child: Text("no_doctors_found".tr));
                }

                return ListView.builder(
                  itemCount: searchResultController.doctorsList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final doctor = searchResultController.doctorsList[index];
                    return DoctorCard(
                      image: doctor.avatarUrl ?? '',
                      name: doctor.name,
                      department: doctor.specialty,
                      hospital: doctor.clinic,
                      rating: doctor.ratingAvg,
                      reviews: doctor.ratingCount,
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
