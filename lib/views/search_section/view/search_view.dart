import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_icons.dart';
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
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titel: 'Search',
        showAction: true,
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
                    style: TextStyle(
                      color: AppColors.black, // ← النص أسود
                      fontSize: 16.sp,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      searchController.addSearch(value);
                      searchController.searchController.clear();
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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
