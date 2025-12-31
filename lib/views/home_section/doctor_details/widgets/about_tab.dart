import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../models/doctor_model.dart';
import '../../../../widgets/general_widgets/section_title.dart';
import 'info_text.dart';

class AboutTab extends StatelessWidget {
  final Doctor doctor;
  const AboutTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        InfoText(doctor.experiencePeriod),
      ],
    );
  }
}
