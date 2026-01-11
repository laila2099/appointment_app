import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/home_screen/controller/category_controller.dart';
import 'package:appointment_app/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:appointment_app/views/home_section/home_screen/widgets/category_item.dart';
import 'package:appointment_app/views/home_section/home_screen/widgets/custom_container.dart';
import 'package:appointment_app/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_gate_service.dart';
import '../../../profile_section/profile_controller/profile_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(CategoryController());
  final profileController = Get.find<ProfileController>();  
  // Initialize doctor controller - will use existing if already registered
  late final DoctorController doctorController = Get.put(
    DoctorController(repository: Get.find<DoctorRepository>()),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    // Load recommended doctors when the home screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorController.loadRecommendedDoctors();
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            SizedBox(
              height: 72.h,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Obx(() {
                        final name = profileController.profile.value?.name;
                        return Text(
                          "Hi, ${name ?? '...'}",
                          style: CustomTextStyles.bold,
                        );
                      }),
                      SizedBox(height: 3.h),
                      Text(
                        "How Are You Today?!",
                        style: CustomTextStyles.custom(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitle,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF5F9FF),
                        ),
                        child: Center(
                          child: IconButton(
                            color: AppColors.black,
                            onPressed: () {
                              Get.find<AuthGateService>().goProtected(
                                AppRoutes.notificationScreen,
                              );
                            },
                            icon: const Icon(Icons.notifications_none),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15.w,
                        top: 13.h,
                        child: Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomContainer(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Doctor Speciality", style: CustomTextStyles.screenTitle),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.doctorSpecialtiesScreen);
                  },
                  child: Text("See All", style: CustomTextStyles.regular),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final item = controller.categories[index];
                  return Row(
                    children: [
                      CategoryItem(iconPath: item.icon, title: item.title),
                      SizedBox(width: 25.w),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation Doctor",
                  style: CustomTextStyles.screenTitle,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.recommendationDoctorScreen);
                  },
                  child: Text("See All", style: CustomTextStyles.regular),
                ),
              ],
            ),
            SizedBox(height: 20.h),
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
                        const SizedBox(height: 16),
                        Text(
                          doctorController.errorMessage.value ?? 
                          'No doctors available',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: doctorController.refresh,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: doctorController.doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctorController.doctors[index];
                    final imagePath = doctorController.getImagePath(doctor);
                    return DoctorCard(
                      onTap: () => Get.toNamed(
                        AppRoutes.doctorDetails,
                        arguments: {'doctorId': doctor.id},
                      ),
                      image: imagePath,
                      name: doctor.name,
                      department: doctor.specialty,
                      hospital: doctor.clinic,
                      rating: doctor.ratingAvg,
                      reviews: doctor.ratingCount,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
