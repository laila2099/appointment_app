import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_controller/booking_controller.dart';
import 'package:appointment_app/views/home_section/booking_appointment/models/appointment_type.dart';
import 'package:appointment_app/views/home_section/booking_appointment/widgets/summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/classes/utils/format_date_time.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_icons.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../widgets/general_widgets/doctor_tile.dart';
import '../../../../../widgets/general_widgets/section_title.dart';

class RescheduleSummary extends StatelessWidget {
  const RescheduleSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BookingController>();

    return Obx(() {
      final a = c.appointment.value;
      final type = AppointmentTypeX.fromId(a.appointmentTypeId);
      final doctor = c.doctor.value;

      return ListView(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 50.h),
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 34.sp),
          ),
          SizedBox(height: 20.h),
          Center(child: SectionTitle('Booking has been rescheduled'.tr)),
          SizedBox(height: 40.h),
          SectionTitle('booking_information'.tr),
          SizedBox(height: 12.h),
          SummaryRow(
            svgAsset: AppIcons.calendar2,
            iconBg: AppColors.secondBlue,
            iconColor: AppColors.primary,
            title: 'date_time'.tr,
            subtitle: formatDateTime(context, a.date, a.time),
          ),
          SummaryRow(
            svgAsset: AppIcons.clipboard,
            iconBg: AppColors.secondGreen,
            iconColor: AppColors.green,
            title: 'appointment_type'.tr,
            subtitle: type.label.tr,
          ),
          SizedBox(height: 18.h),
          SectionTitle('doctor_information'.tr),
          SizedBox(height: 12.h),
          if (doctor != null)
            DoctorTile.details(
              name: doctor.name,
              specialty: doctor.specialty,
              clinic: doctor.clinic,
              rating: doctor.ratingAvg,
              reviewsCount: doctor.ratingCount,
              avatar: const AssetImage(AppImages.doctor),
              showChat: false,
            ),
          SizedBox(height: 18.h),
        ],
      );
    });
  }
}
