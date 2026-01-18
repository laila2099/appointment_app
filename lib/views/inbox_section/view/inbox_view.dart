import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/inbox_section/view/widget/Bottom_Sheet.dart';
import 'package:appointment_app/views/inbox_section/view/widget/inbox_item.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_button.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/search/search_text_field.dart';
import '../controller/inbox_controller.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          AppHeader(
            center: HeaderTitle('message'.tr),
            trailing: HeaderButton(
              onTap: () {
                showInboxSheet(context);
              },
              child: SvgPicture.asset(
                AppIcons.add,
                width: 24.w,
                height: 24.h,
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
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
                  SizedBox(height: 8.h),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        itemCount: controller.inboxList.length,
                        itemBuilder: (context, index) {
                          return InboxItem(
                            onTap: () {
                              Get.toNamed(AppRoutes.chat);
                            },
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
