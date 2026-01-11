import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_button.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../../../widgets/general_widgets/doctor_tile.dart';
import '../../../../widgets/general_widgets/primary_button.dart';
import '../doctor_details_controller/doctor_details_controller.dart';
import '../widgets/about_tab.dart';
import '../widgets/location_tab.dart';
import '../widgets/reviews_tab.dart';

class DoctorDetailsScreen extends GetView<DoctorDetailsController> {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.doctor.value == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    controller.errorMessage.value ?? 'doctor_not_found'.tr,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.refresh,
                    child: Text('retry'.tr),
                  ),
                ],
              ),
            );
          }

          final doctor = controller.doctor.value!;
          return Column(
            children: [
              AppHeader(
                // onBack: Get.back,
                center: HeaderTitle(doctor.name),
                trailing: HeaderButton(
                  onTap: () {},
                  child: Icon(
                    Icons.more_horiz,
                    size: 22.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              DoctorTile.details(
                name: doctor.name,
                specialty: doctor.specialty,
                clinic: doctor.clinic,
                rating: doctor.ratingAvg,
                reviewsCount: doctor.ratingCount,
                avatar: const AssetImage(AppImages.doctor),
                onChatTap: () {
                  print("MODEL IMAGE => ${doctor.avatarUrl}");
                },
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: AppColors.primary,
                        indicatorColor: AppColors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(fontSize: 14.sp),
                        tabs: [
                          Tab(text: "about".tr),
                          Tab(text: "location".tr),
                          Tab(text: "reviews".tr),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AboutTab(doctor: doctor),
                            LocationTab(doctor: doctor),
                            ReviewsTab(reviews: controller.reviews),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
                text: "make_appointment".tr,
                onPressed: controller.onMakeAppointment,
              ),
            ],
          );
        }),
      ),
    );
  }
}
