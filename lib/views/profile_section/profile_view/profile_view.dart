import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../widgets/general_widgets/custom_divider.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_tabs.dart';
import 'widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navCtrl = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: Stack(
              children: [
                Container(color: AppColors.primary),
                Container(
                  margin: EdgeInsets.only(top: 92.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 32.h,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const ProfileInfo(),
                        const SizedBox(height: 32),
                        const ProfileTabs(),
                        const SizedBox(height: 24),
                        ProfileTile(
                          iconPath: AppIcons.personalCard,
                          title: "Personal Information",
                          iconColor: AppColors.primary,
                          bgColor: const Color(0xFFD8E7FE),
                          onTap: () {
                            Get.toNamed(AppRoutes.personalInfo);
                          },
                        ),
                        const CustomDivider(),
                        ProfileTile(
                          iconPath: AppIcons.medicalRecord,
                          title: "My Test & Diagnostic",
                          iconColor: AppColors.green,
                          bgColor: const Color(0xFFDCF4E7),
                          onTap: () {
                            Get.toNamed(AppRoutes.medicalRecordsScreen);
                          },
                        ),
                        const CustomDivider(),
                        ProfileTile(
                          iconPath: AppIcons.wallet,
                          title: "Payment",
                          iconColor: AppColors.red,
                          bgColor: const Color(0xFFFEE1E1),
                          onTap: () {
                            Get.toNamed(AppRoutes.paymentScreen);
                          },
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
