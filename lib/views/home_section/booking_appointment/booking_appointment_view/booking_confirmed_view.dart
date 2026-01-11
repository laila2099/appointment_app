import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/classes/utils/format_date_time.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_icons.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../../../widgets/general_widgets/doctor_tile.dart';
import '../../../../widgets/general_widgets/section_title.dart';
import '../../doctor_details/widgets/rate_doctor/rate_doctor_sheet.dart';
import '../booking_appointment_controller/booking_controller.dart';
import '../models/appointment_type.dart';
import '../widgets/summary_row.dart';

class BookingConfirmedScreen extends GetView<BookingController> {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          final appointment = controller.appointment.value;
          final type = AppointmentTypeX.fromId(appointment.appointmentTypeId);
          final doctor = controller.doctor.value;

          return Column(
            children: [
              AppHeader(
                onBack: Get.back,
                center: HeaderTitle('details'.tr),
              ),

              SizedBox(height: 40.h),

              // Check + title
              Container(
                width: 70.w,
                height: 70.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF22C55E),
                ),
                child: Icon(Icons.check, color: Colors.white, size: 34.sp),
              ),
              SizedBox(height: 20.h),
              SectionTitle('booking_confirmed'.tr),

              SizedBox(height: 24.h),

              Expanded(
                child: ListView(
                  padding: EdgeInsetsDirectional.fromSTEB(27.w, 0, 20.w, 20.h),
                  children: [
                    SectionTitle('booking_information'.tr),
                    SizedBox(height: 24.h),
                    SummaryRow(
                      svgAsset: AppIcons.calendar2,
                      iconBg: AppColors.secondBlue,
                      iconColor: AppColors.primary,
                      title: 'date_time'.tr,
                      subtitle: formatDateTime(
                        context,
                        appointment.date,
                        appointment.time,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SummaryRow(
                      svgAsset: AppIcons.clipboard,
                      iconBg: AppColors.secondGreen,
                      iconColor: AppColors.green,
                      title: 'appointment_type'.tr,
                      subtitle: type.label.tr,
                      trailing: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: BorderSide(color: AppColors.primary),
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          textStyle: CustomTextStyles.body12.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Text('get_location'.tr),
                      ),
                    ),
                    SizedBox(height: 24.h),
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
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.w, 10.h, 20.w, 16.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.until(
                        (route) =>
                            route.settings.name == AppRoutes.doctorDetails,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.bottomSheet(
                          const RateDoctorSheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'done'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
