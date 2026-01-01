import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/views/home_section/find_nearby/widget/location_doctor.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/widgets/custom_search.dart';
import 'package:appointment_app/widgets/doctor_card.dart';
import 'package:appointment_app/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:appointment_app/widgets/map_widget.dart';
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
          SizedBox.expand(child: MapWidget()),
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: CustomSearch(icon: AppIcons.setting),
          ),
          Padding(
            padding: EdgeInsets.only(top: 550.h, left: 16.w, right: 16.w),
            child: SizedBox(
              height: 100.h,
              child: DoctorCard(
                widthimage: 75.w,
                heightimage: 75.h,
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
          LocationDoctor(
            top: 233.h,
            right: 286.w,
            left: 38.w,
            image: AppImages.doctor2,
          ),
          LocationDoctor(
            top: 118.h,
            right: 183.w,
            left: 142.w,
            image: AppImages.doctor3,
          ),
          LocationDoctor(
            top: 173.h,
            right: 51.w,
            left: 274.w,
            image: AppImages.doctor5,
          ),
          LocationDoctor(
            top: 318.h,
            right: 28.w,
            image: AppImages.doctor4,
          ),
          LocationDoctor(
            widthimage: 75,
            heightimage: 70,
            width: 80,
            height: 80,
            top: 400.h,
            right: 80.w,
            left: 215.w,
            image: AppImages.doctor1,
          ),
        ],
      ),
    );
  }
}
