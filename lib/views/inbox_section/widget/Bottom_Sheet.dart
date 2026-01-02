import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/inbox_controller.dart';
import '../inbox_binding/inbox_bottom_sheet_binding.dart';
import 'inbox_item.dart';
import '../../../widgets/search/search_text_field.dart';
import '../../../core/constant/app_colors.dart';

void showInboxSheet(BuildContext context) {
  InboxBottomSheetBinding().dependencies();
  final InboxController controller = Get.find<InboxController>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Obx(
              () {
            return DraggableScrollableSheet(
              expand: false,
              maxChildSize: 0.9,
              minChildSize: 0.3,
              initialChildSize: 0.6,
              builder: (_, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 50.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      const SearchTextField(
                        hintText: 'Search Message',
                      ),

                      SizedBox(height: 16.h),

                      Expanded(
                        child: ListView.separated(
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
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
