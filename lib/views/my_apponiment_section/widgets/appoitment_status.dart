import 'package:appointment_app/models/appoitments_details.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_controller/my_appoitment_controller.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/status_card.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppoitmentStatus extends GetView<MyAppointmentsController> {
  final AppointmentStatus status;

  const AppoitmentStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final filteredAppointments =
          controller.appointments.where((a) => a.status == status).toList();

      if (filteredAppointments.isEmpty) {
        String text = "";
        switch (status) {
          case AppointmentStatus.upcoming:
            text = "no_upcoming".tr;
            break;
          case AppointmentStatus.completed:
            text = "no_completed".tr;
            break;
          case AppointmentStatus.cancelled:
            text = "no_cancelled".tr;
            break;
        }
        return Center(child: Text(text));
      }

      return ListView.separated(
        shrinkWrap: true,
        itemCount: filteredAppointments.length,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final appt = filteredAppointments[index];

          if (appt.status == AppointmentStatus.upcoming) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
              child: UpcomingCard(appt: appt),
            );
          } else {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
              child: StatusCard(appt: appt),
            );
          }
        },
      );
    });
  }
}
