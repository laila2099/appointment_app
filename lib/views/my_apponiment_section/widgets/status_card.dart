import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/models/appoitments_details.dart';
import 'package:appointment_app/widgets/general_widgets/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatusCard extends StatelessWidget {
  final AppointmentDetailsModel appt;

  const StatusCard({required this.appt, super.key});

  @override
  Widget build(BuildContext context) {
    String dateText = DateFormat(
      'EEE, dd MMM',
    ).format(appt.appointmentDateTime);
    String time = DateFormat('hh:mm a').format(appt.appointmentDateTime);

    String statusText = '';
    Color statusColor = AppColors.black;
    switch (appt.status) {
      case AppointmentStatus.completed:
        statusText = 'appointment_done'.tr;
        statusColor = AppColors.green;
        break;
      case AppointmentStatus.cancelled:
        statusText = 'appointment_cancelled'.tr;
        statusColor = AppColors.red;
        break;
      default:
    }

    if (appt.status == AppointmentStatus.upcoming) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      style: CustomTextStyles.custom(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: statusColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "$dateText  |  $time",
                      style: CustomTextStyles.custom(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.infoText,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                  color: AppColors.lightGrey,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Container(height: 1.h, color: AppColors.separator),
            SizedBox(height: 8.h),
            DoctorTile.details(
              name: appt.doctorName,
              specialty: appt.specialty,
              clinic: appt.clinic,
              rating: appt.rating,
              reviewsCount: appt.reviewsCount,
              avatar: AppImages.nurse,
            ),
          ],
        ),
      ),
    );
  }
}
