import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/home_screen/controller/category_controller.dart';
import 'package:appointment_app/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:appointment_app/views/home_section/home_screen/widgets/category_item.dart';
import 'package:appointment_app/views/home_section/home_screen/widgets/custom_container.dart';
import 'package:appointment_app/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_gate_service.dart';
import '../../../profile_section/profile_controller/profile_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categoryController = Get.put(CategoryController());
  final profileController = Get.find<ProfileController>();

  late final DoctorController doctorController = Get.put(
    DoctorController(repository: Get.find<DoctorRepository>()),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      doctorController.loadRecommendedDoctors();
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.all(16.r),
            child: Column(
              children: [
                SizedBox(height: 15.h),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() {
                                  final name =
                                      profileController.profile.value?.name;
                                  return Text(
                                    "Hi, ${name ?? '...'}",
                                    style: CustomTextStyles.bold.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }),
                                SizedBox(height: 3.h),
                                Text(
                                  "how_are_you_today".tr,
                                  style: CustomTextStyles.custom(
                                    fontSize: 11.sp,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subtitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            children: [
                              Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF5F5F5),
                                ),
                                child: Center(
                                  child: IconButton(
                                    color: AppColors.black,
                                    onPressed: () {
                                      Get.find<AuthGateService>().goProtected(
                                        AppRoutes.notificationScreen,
                                      );
                                    },
                                    icon: SvgPicture.asset(
                                      AppIcons.notification,
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                end: 15.w,
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

                    /// 🔹 CUSTOM CONTAINER OVER HEADER
                    Positioned(
                      top: 95.h,
                      left: 0,
                      right: 0,
                      child: CustomContainer(),
                    ),
                  ],
                ),

                /// space after stack
                SizedBox(height: 210.h),

                Column(
                  children: [
                    SizedBox(height: 35.h),

                    /// SPECIALITY
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("doctor_speciality".tr,
                            style: CustomTextStyles.screenTitle),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsetsDirectional.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            doctorController.sortDoctorsBySpeciality(
                              source: CategoryPickerSource.specialtiesScreen,
                            );
                          },
                          child: Text("see_all".tr,
                              style: CustomTextStyles.regular),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    /// CATEGORIES
                    SizedBox(
                      height: 100.h,
                      child: Obx(() {
                        if (categoryController.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (categoryController.errorMessage.value != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(categoryController.errorMessage.value!),
                                SizedBox(height: 12.h),
                                ElevatedButton(
                                  onPressed:
                                      categoryController.retryFetchCategories,
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        if (categoryController.categories.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No categories available'),
                                SizedBox(height: 12.h),
                                ElevatedButton(
                                  onPressed:
                                      categoryController.retryFetchCategories,
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryController.categories.length,
                          itemBuilder: (context, index) {
                            final item = categoryController.categories[index];
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    doctorController.filterDoctors(
                                      categoryId: item.title == 'general'
                                          ? null
                                          : item.id,
                                    );
                                  },
                                  child: CategoryItem(
                                    iconPath: item.iconUrl,
                                    title: item.title,
                                  ),
                                ),
                                SizedBox(width: 25.w),
                              ],
                            );
                          },
                        );
                      }),
                    ),

                    SizedBox(height: 24.h),

                    /// RECOMMENDED DOCTORS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "recommendation_doctor".tr,
                          style: CustomTextStyles.screenTitle,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsetsDirectional.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.recommendationDoctorScreen);
                          },
                          child: Text("see_all".tr,
                              style: CustomTextStyles.regular),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Obx(() {
                      if (doctorController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (doctorController.doctors.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.medical_services_outlined,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                doctorController.errorMessage.value ??
                                    'no_doctors_available'.tr,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: doctorController.refresh,
                                child: Text('retry'.tr),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctorController.doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctorController.doctors[index];
                          final imagePath =
                              doctorController.getImagePath(doctor);

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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
