import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/custom_bottom_sheet.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/custom_search.dart';
import 'package:appointment_app/widgets/doctor_card.dart';
import 'package:appointment_app/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendationDoctorScreen extends StatelessWidget {
  const RecommendationDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get or create the doctor controller
    final doctorController = Get.isRegistered<DoctorController>()
        ? Get.find<DoctorController>()
        : Get.put(
            DoctorController(repository: Get.find<DoctorRepository>()),
            permanent: true,
          );
    
    // Load ALL doctors for the "See All" page (not just recommended) when screen is built
    // Always reload when this screen is shown to ensure we have all doctors, not just recommended
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!doctorController.isLoading.value) {
        doctorController.loadDoctors();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        titel: "Recommendation Doctor",
        showAction: true,
        actionicon: Icon(Icons.more_horiz, size: 24.sp, color: AppColors.black),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),

          CustomSearch(
            icon: AppIcons.sort,
            onTap: () => Get.bottomSheet(CustomBottomSheet()),
          ),

          SizedBox(height: 24.h),

          // -------------------- DOCTORS LIST --------------------
          Expanded(
            child: Obx(() {
              if (doctorController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (doctorController.doctors.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.medical_services_outlined,
                          size: 64, color: Colors.grey),
                      SizedBox(height: 16.h),
                      Text(
                        doctorController.errorMessage.value ??
                            'No doctors available',
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: doctorController.refresh,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: doctorController.doctors.length,
                  separatorBuilder: (_, __) => SizedBox(height: 14.h),
                  itemBuilder: (context, index) {
                    final doctor = doctorController.doctors[index];

                    final imagePath = doctorController.getImagePath(doctor);
                    return DoctorCard(
                      onTap: () => Get.toNamed(
                        AppRoutes.doctorDetails,
                        arguments: {'doctorId': doctor.id},
                      ),
                      shadow: true,
                      image: imagePath,
                      name: doctor.name,
                      department: doctor.specialty,
                      hospital: doctor.clinic,
                      rating: doctor.ratingAvg,
                      reviews: doctor.ratingCount,
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
