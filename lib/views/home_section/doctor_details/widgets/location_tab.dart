import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../models/doctor_model.dart';
import '../../../../widgets/general_widgets/section_title.dart';
import '../../../../widgets/map_widget.dart';
import '../doctor_details_controller/doctor_details_controller.dart';

class LocationTab extends StatelessWidget {
  final Doctor doctor;
  const LocationTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final pos = LatLng(doctor.lat, doctor.lng);
    final controller = Get.put(DoctorDetailsController());

    return ListView(
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0),
      children: [
        SectionTitle("practice_place".tr),
        SizedBox(height: 12.h),
        Text(
          doctor.locationText,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              height: 1.8,
              color: AppColors.subtitle),
        ),
        SizedBox(height: 18.h),
        SectionTitle("location_map".tr),
        SizedBox(height: 12.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: SizedBox(
            height: 258.h,
            child: MapWidget(),
          ),
        ),
      ],
    );
  }
}
