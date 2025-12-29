import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../../../../models/doctor_model.dart';
import 'info_text.dart';
import 'section_title.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../models/doctor_model.dart';
import '../../../../widgets/general_widgets/section_title.dart';
import 'info_text.dart';
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c

class AboutTab extends StatelessWidget {
  final Doctor doctor;
  const AboutTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListView(
<<<<<<< HEAD
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      children: [
        const SectionTitle("About me"),
        const SizedBox(height: 12),

        InfoText(doctor.about),

        const SizedBox(height: 24),

        const SectionTitle("Working Time"),
        const SizedBox(height: 12),

        InfoText(doctor.workingTime),

        const SizedBox(height: 24),

        const SectionTitle("STR"),
        const SizedBox(height: 12),

        InfoText(doctor.strNumber),

        const SizedBox(height: 24),

        const SectionTitle("Pengalaman Praktik"),
        const SizedBox(height: 12),
        InfoText(doctor.experiencePlace, emphasis: true),
        const SizedBox(height: 16),
=======
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0.h),
      children: [
        SectionTitle("about_me".tr),
        SizedBox(height: 12.h),

        InfoText(doctor.about),

        SizedBox(height: 24.h),

        SectionTitle("working_time".tr),
        SizedBox(height: 12.h),

        InfoText(doctor.workingTime),

        SizedBox(height: 24.h),

        SectionTitle("str".tr),
        SizedBox(height: 12.h),

        InfoText(doctor.strNumber),

        SizedBox(height: 24.h),

        SectionTitle("practice_experience".tr),
        SizedBox(height: 12.h),
        InfoText(doctor.experiencePlace, emphasis: true),
        SizedBox(height: 16.h),
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
        InfoText(doctor.experiencePeriod),
      ],
    );
  }
}
