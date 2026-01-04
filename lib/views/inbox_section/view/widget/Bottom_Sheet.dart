import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../widgets/search/search_text_field.dart';
import '../../controller/inbox_controller.dart';
import '../../inbox_binding/inbox_bottom_sheet_binding.dart';
import 'inbox_item.dart';

void showInboxSheet(BuildContext context) {
  // Bindings
  InboxBottomSheetBinding().dependencies();
  final InboxController controller = Get.find<InboxController>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          initialChildSize: 0.6,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              child: Column(
                children: [
                  // الخط الصغير فوق
                  Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Search داخل البوتوم شيت
                  const SearchTextField(
                    hintText: 'Search Message',
                  ),

                  SizedBox(height: 16.h),

                  // القائمة (Obx فقط هنا ✅)
                  Expanded(
                    child: Obx(() {
                      if (controller.inboxList.isEmpty) {
                        return Center(
                          child: Text(
                            'No messages found',
                            style: TextStyle(
                              color: AppColors.subtitle,
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        controller: scrollController,
                        itemCount: controller.inboxList.length,
                        itemBuilder: (context, index) {
                          return InboxItem(
                            model: controller.inboxList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.separator,
                            thickness: 1,
                            height: 12.h,
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
