import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../widgets/search/search_text_field.dart';
import '../../controller/inbox_controller.dart';
import '../../inbox_binding/inbox_bottom_sheet_binding.dart';
import 'inbox_item.dart';

void showInboxSheet(BuildContext context) {
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
        padding: EdgeInsetsDirectional.only(
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
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close),
                        color: AppColors.black,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Text(
                        "create_new_message".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Flexible(
                          child: SearchTextField(
                            hintText: 'search_message'.tr,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.filter_list,
                          color: AppColors.black,
                          size: 24.w,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // الرسائل
                  Flexible(
                    child: Obx(() {
                      if (controller.inboxList.isEmpty) {
                        return Center(
                          child: Text(
                            'no_messages'.tr,
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
