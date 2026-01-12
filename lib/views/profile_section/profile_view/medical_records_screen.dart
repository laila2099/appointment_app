import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_icons.dart';
import '../../../core/constant/text_style.dart';
import '../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../widgets/general_widgets/app_header/header_button.dart';
import 'widgets/medical_record/medical_record_row.dart';
import 'widgets/medical_record/medical_record_section.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                onBack: Get.back,
                center: Text(
                  "medical_record".tr,
                  style: CustomTextStyles.screenTitle,
                ),
                trailing: HeaderButton(
                  child: SvgPicture.asset(
                    AppIcons.three_point,
                    width: 22.sp,
                    height: 22.sp,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// This Month
                    MedicalRecordSection(
                      title: "this_month".tr,
                      children: [
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "end_of_observation".tr,
                          details: [],
                        ),
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "blood_analysis".tr,
                          details: [
                            '${"red_blood_cell".tr}: 4.10 million cells/mcL',
                            '${"hemoglobin".tr}: 142 grams/L',
                            '${"hematocrit".tr}: 33.6%',
                            '${"white_blood_cells".tr}: 3.850 cells/mcL',
                          ],
                        ),
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "blood_analysis".tr,
                          details: [
                            '${"red_blood_cell".tr} : 3.90 million cells/mcL',
                            '${"hemoglobin".tr} : 122 grams/L',
                            '${"hematocrit".tr} : 47.7%',
                            '${"white_blood_cells".tr} : 4.300 cells/mcL',
                          ],
                        ),
                      ],
                    ),

                    /// January
                    MedicalRecordSection(
                      title: 'January',
                      children: [
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "end_of_observation".tr,
                          details: [],
                        ),
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "blood_analysis".tr,
                          details: [
                            '${"red_blood_cell".tr} : 4.30 million cells/mcL',
                            '${"hemoglobin".tr} : 132 grams/L',
                            '${"hematocrit".tr} : 37.7%',
                            '${"white_blood_cells".tr} : 4.700 cells/mcL',
                          ],
                        ),
                        MedicalRecordRow(
                          date: 'Feb 25',
                          title: "blood_analysis".tr,
                          details: [
                            '${"red_blood_cell".tr} : 3.90 million cells/mcL',
                            '${"hemoglobin".tr} : 118 grams/L',
                            '${"hematocrit".tr} : 38.7%',
                            '${"white_blood_cells".tr} : 4.500 cells/mcL',
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
