import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../../../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../controller/search_controller.dart';
import '../widget/recent_search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchViewController>();

    return Scaffold(
      appBar: CustomAppBar(
        titel: 'Search',
        showAction: true,
        actionicon: Icon(Icons.clear_all, color: AppColors.primary),
        onactiontap: () {
          searchController.clearHistory();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: 'Search',
                    controller: searchController.searchController,
                    prefixIcon: Icon(Icons.search, color: AppColors.primary),
                    onChanged: (value) {
                      searchController.addSearch(value);
                    },
                  ),
                ),
                SizedBox(width: 8.w),
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
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                return RecentSearchWidget(
                  recentSearches: searchController.recentSearches.toList(),
                  textColor: AppColors.black,
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
