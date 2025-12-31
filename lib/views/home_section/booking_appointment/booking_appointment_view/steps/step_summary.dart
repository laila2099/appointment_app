import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/classes/utils/format_date_time.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_icons.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/text_style.dart';
import '../../../../../widgets/general_widgets/doctor_tile.dart';
import '../../../../../widgets/general_widgets/section_title.dart';
import '../../booking_appointment_controller/booking_controller.dart';
import '../../models/appointment_type.dart';
import '../../widgets/summary_row.dart';

class StepSummary extends StatelessWidget {
  const StepSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BookingController>();

    return Obx(() {
      final a = c.appointment.value;
      final type = AppointmentTypeX.fromId(a.appointmentTypeId);
      final payment = c.selectedPayment.value;
      final doctor = c.doctor.value;

      return ListView(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 50.h),
        children: [
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
          SectionTitle('payment_information'.tr),
          SizedBox(height: 12.h),
          _PaymentRow(
            svgLogo: _paymentLogo(payment?.type),
            title: payment?.label ?? '-',
            subtitle: _paymentMask(payment?.last4),
            onChange: () => c.stepIndex.value = 1,
          ),
        ],
      );
    });
  }

  static String _paymentMask(String? last4) {
    if (last4 == null || last4.isEmpty) return '';
    return '************ $last4';
  }

  static String _paymentLogo(String? type) {
    return AppIcons.card;
  }
}

class _PaymentRow extends StatelessWidget {
  final String svgLogo;
  final String title;
  final String subtitle;
  final VoidCallback onChange;

  const _PaymentRow({
    required this.svgLogo,
    required this.title,
    required this.subtitle,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(svgLogo, width: 26.w, height: 26.w),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Text(subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      )),
                ],
              ],
            ),
          ),
          OutlinedButton(
            onPressed: onChange,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: BorderSide(color: AppColors.primary),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.r),
              ),
              textStyle: CustomTextStyles.body12.copyWith(
                color: AppColors.primary,
              ),
            ),
            child: Text('change'.tr),
          ),
        ],
      ),
    );
  }
}
