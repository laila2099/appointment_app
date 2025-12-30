import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_button.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../home_screen/widgets/doctor_tile.dart';
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

          final doctor = controller.doctor.value!;
          return Column(
            children: [
              AppHeader(
                leading: HeaderButton(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                center: HeaderTitle(doctor.name),
                trailing: HeaderButton(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_horiz,
                    size: 22,
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
                avatar: const AssetImage(AppImages.doctor1),
                onChatTap: () {},
              ),

              const SizedBox(height: 8),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: AppColors.primary,

                        indicatorColor: AppColors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: "About"),
                          Tab(text: "Location"),
                          Tab(text: "Reviews"),
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
                text: "Make An Appointment",
                onPressed: controller.onMakeAppointment,
              ),
            ],
          );
        }),
      ),
    );
  }
}
