import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';
import '../../../core/constant/app_colors.dart';

class RecentSearchWidget extends StatelessWidget {
  final List<String> recentSearches;
  final Color textColor;

  const RecentSearchWidget({
    super.key,
    required this.recentSearches,
    this.textColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchViewController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Search',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                searchController.clearHistory();
              },
              child: Text(
                'Clear History',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ...recentSearches.asMap().entries.map((entry) {
          int index = entry.key;
          String search = entry.value;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(
              children: [
                if (index < 4)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 18.w, height: 3.h, color: AppColors.black, margin: EdgeInsets.only(bottom: 2.h)),
                      Container(width: 12.w, height: 3.h, color: AppColors.black, margin: EdgeInsets.only(bottom: 2.h)),
                      Container(width: 6.w, height: 3.h, color: AppColors.black),
                    ],
                  )
                else
                  SizedBox(width: 18.w),

                SizedBox(width: 12.w),

                Expanded(
                  child: Text(
                    search,
                    style: TextStyle(fontSize: 16.sp, color: textColor),
                  ),
                ),

                InkWell(
                  onTap: () {
                    searchController.removeSearch(search);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        if (recentSearches.isEmpty)
          Center(
            child: Text(
              "No recent searches",
              style: TextStyle(color: textColor),
            ),
          ),
      ],
    );
  }
}
