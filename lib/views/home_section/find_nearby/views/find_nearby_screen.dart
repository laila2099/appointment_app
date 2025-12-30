import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/core/constant/app_icons.dart';
import 'package:app_appointment/core/constant/app_images.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/widgets/custom_search.dart';
import 'package:app_appointment/widgets/doctor_card.dart';
import 'package:app_appointment/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindNearbyScreen extends StatelessWidget {
  const FindNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titel: "Find Nearby"),
      body: Stack(
        children: [
          
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: CustomSearch(icon: AppIcons.setting),
          ),
          Padding(
            padding: EdgeInsets.only(top: 550.h, left: 16.w, right: 16.w),
            child: SizedBox(
              height: 100.h,
              child: DoctorCard(
                height: 91.h,
                image: AppImages.doctor1,
                name: "Dr. Randy Wigham",
                department: "General",
                hospital: "RSUD Gatot Subroto",
                rating: 4.8,
                reviews: 4279,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
