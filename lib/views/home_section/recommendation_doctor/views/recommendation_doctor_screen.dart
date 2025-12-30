import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/core/constant/app_icons.dart';
import 'package:app_appointment/routes/app_routes.dart';
import 'package:app_appointment/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/widgets/custom_bottom_sheet.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/widgets/custom_search.dart';
import 'package:app_appointment/widgets/doctor_card.dart';
import 'package:app_appointment/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendationDoctorScreen extends StatelessWidget {
  RecommendationDoctorScreen({super.key});
  final doctorcontroller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: doctorcontroller.doctors.length,
                itemBuilder: (context, index) {
                  final d = doctorcontroller.doctors[index];
                  return Column(
                    children: [
                      DoctorCard(
                        onTap: ()=> Get.toNamed(AppRoutes.doctorDetails),
                        shadow: true,
                        image: d.image,
                        name: d.name,
                        department: d.department,
                        hospital: d.hospital,
                        rating: d.rating,
                        reviews: d.reviews,
                      ),
                      SizedBox(height: 14.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
