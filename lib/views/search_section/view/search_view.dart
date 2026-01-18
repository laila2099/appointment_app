import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/custom_bottom_sheet.dart';
import 'package:appointment_app/widgets/search/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../controller/search_controller.dart';
import '../widget/recent_search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewController = Get.find<SearchViewController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titel: 'search'.tr,
        showAction: true,
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    controller: searchViewController.searchController,
                    hintText: 'search_message'.tr,
                    onSubmitted: (value) async {
                      if (value.trim().isNotEmpty) {
                        searchViewController.addSearch(value);
                        Get.toNamed(AppRoutes.searchresult,
                                arguments: {'query': value})
                            ?.then((result) =>
                                searchViewController.searchController.clear());
                      }
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: () async {
                    final result = await Get.bottomSheet(
                      CustomBottomSheet(),
                      isScrollControlled: true,
                    );
                    print(result);

                    Get.toNamed(
                      AppRoutes.searchresult,
                      arguments: {
                        'query': null,
                        'categoryId': result,
                        'ratingIndex': null,
                      },
                    );
                  },
                  icon: Icon(
                    Icons.filter_list,
                    color: AppColors.black,
                    size: 24.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                return RecentSearchWidget(
                  recentSearches: searchViewController.recentSearches.toList(),
                  textColor: AppColors.black,
                  onTap: (selectedText) {
                    searchViewController.addSearch(selectedText);
                    Get.toNamed(AppRoutes.searchresult, arguments: selectedText)
                        ?.then((result) =>
                            searchViewController.searchController.clear());
                    // Get.toNamed(AppRoutes.searchresult, arguments: selectedText)
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
