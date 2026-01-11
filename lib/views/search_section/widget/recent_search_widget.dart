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
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'recent_search'.tr,
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
                'clear_all'.tr,
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

        // نستخدم Flexible بدل Expanded لتجنب nested Expanded
        Flexible(
          child: recentSearches.isEmpty
              ? Center(
                  child: Text(
                    "no_recent".tr,
                    style: TextStyle(color: textColor),
                  ),
                )
              : ListView.builder(
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index) {
                    String search = recentSearches[index];
                    return Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 6.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.lightGrey,
                            size: 18.w,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              search,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              searchController.removeSearch(search);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
