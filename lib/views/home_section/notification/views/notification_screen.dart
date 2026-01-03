import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/home_section/notification/controller/notification_controller.dart';
import 'package:appointment_app/views/home_section/notification/widgets/notification_item.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        leading: HeaderButton(
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18.sp,
            color: AppColors.black,
          ),
        ),
        center: Text(
          "Doctor Speciality",
          style: CustomTextStyles.screenTitle,
        ),
        trailing: HeaderButton(
          showBorder: false,
          child: Container(
            width: 51.w,
            height: 27.h,
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
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style: TextStyle(fontSize: 16.sp, color: Color(0xff9E9E9E)),
                ),
                Text("Mark all as read", style: CustomTextStyles.regular),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: notificationController.notifications.length,
                  itemBuilder: (context, index) {
                    final notification =
                        notificationController.notifications[index];
                    return Column(
                      children: [
                        NotificationItem(
                          notification: notification,
                          onTap: () {},
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
