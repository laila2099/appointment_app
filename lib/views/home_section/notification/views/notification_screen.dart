import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/home_section/notification/controller/notification_controller.dart';
import 'package:appointment_app/views/home_section/notification/widgets/notification_item.dart';
import 'package:appointment_app/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        showActionBorder: false,
        showAction: true,
        width: 51.w,
        height: 27.h,
        titel: "notifications".tr,
        actionicon: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(
            child: Text(
              "2 New",
              style: TextStyle(fontSize: 12.sp, color: AppColors.white),
            ),
          ),
        ),
      ),
      body: Obx(() => ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: _header(
                  title: "today".tr,
                  action: GestureDetector(
                    onTap: controller.markAllAsRead,
                    child: Text(
                      "mark_all_as_read".tr,
                      style: CustomTextStyles.regular,
                    ),
                  ),
                ),
              ),
              ...controller.todayNotifications.map(
                (n) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: NotificationItem(
                    notification: n,
                    onTap: () => controller.markAsRead(n),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: _header(title: "yesterday".tr),
              ),
              ...controller.yesterdayNotifications.map(
                (n) => Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: NotificationItem(
                    notification: n,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _header({required String title, Widget? action}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, color: const Color(0xff9E9E9E)),
          ),
          if (action != null) action,
        ],
      ),
    );
  }
}
