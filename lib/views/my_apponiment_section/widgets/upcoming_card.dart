import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/models/appoitments_details.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/status_button.dart';
import 'package:appointment_app/widgets/general_widgets/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../home_section/booking_appointment/booking_appointment_binding/booking_binding.dart';
import '../../home_section/booking_appointment/booking_appointment_controller/booking_controller.dart';
import '../reschedule/reschedule_view.dart';

class UpcomingCard extends StatelessWidget {
  final AppointmentDetailsModel appt;
  final MyAppointmentsController controller = Get.find();
  final BookingController bookingController = Get.find();

  UpcomingCard({required this.appt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Column(
          children: [
            DoctorTile.withDate(
              name: appt.doctorName,
              specialty: appt.specialty,
              clinic: appt.clinic,
              dateText: DateFormat('EEE, dd MMM').format(appt.appointmentDateTime),
              time: DateFormat('hh:mm a').format(appt.appointmentDateTime),
              avatar: const AssetImage(AppImages.doctor),
              showChat: true,
              onChatTap: () {},
            ),
            SizedBox(height: 15.h),
            Container(height: 1.h, color: AppColors.separator),
            SizedBox(height: 15.h),
            Row(
              children: [
                StatusButton(
                  label: 'Cancel Appointment',
                  variant: ButtonVariant.stroke,
                  onPressed: () {
                    controller.cancelAppointment(appt);
                  },
                ),
                SizedBox(width: 10.w),
                StatusButton(
                  label: 'Reschedule',
                  variant: ButtonVariant.filled,
                  onPressed: () {
                    Get.to(() => RescheduleScreen(), binding: BookingBinding(), arguments: appt.toAppointmentModel());

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
