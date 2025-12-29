import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/doctor_model.dart';
import 'section_title.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/doctor_model.dart';
import '../../../../widgets/general_widgets/section_title.dart';
import '../doctor_details_controller/doctor_details_controller.dart';
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c

class LocationTab extends StatelessWidget {
  final Doctor doctor;
  const LocationTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final pos = LatLng(doctor.lat, doctor.lng);
<<<<<<< HEAD

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      children: [
        const SectionTitle("Practice Place"),
        const SizedBox(height: 12),
        Text(doctor.locationText),
        const SizedBox(height: 18),

        const SectionTitle("Location Map"),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 258,
=======
    final controller = Get.put(DoctorDetailsController());

    return ListView(
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0.h),
      children: [
        SectionTitle("practice_place".tr),
        SizedBox(height: 12.h),
        Text(doctor.locationText),
        SizedBox(height: 18.h),

        SectionTitle("location_map".tr),
        SizedBox(height: 12.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: SizedBox(
            height: 258.h,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: pos, zoom: 13),
              markers: {
                Marker(markerId: const MarkerId("clinic"), position: pos),
              },
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              liteModeEnabled: true,
            ),
          ),
        ),
      ],
    );
  }
}
