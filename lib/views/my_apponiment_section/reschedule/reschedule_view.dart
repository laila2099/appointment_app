import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_controller/booking_controller.dart';
import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_view/steps/step_date_time.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/reschedule_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../../../widgets/general_widgets/primary_button.dart';
import '../../../models/appointment_model.dart';

class RescheduleScreen extends GetView<BookingController> {
   RescheduleScreen({super.key});

  final argAppointment = Get.arguments as Appointment?;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              AppHeader(
                center: HeaderTitle('Reschedule'),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Obx(() {
                  final index = controller.stepIndex.value.clamp(0, 1);
                  return IndexedStack(
                    index: index,
                    children: const [StepDateTime(), RescheduleSummary()],
                  );
                }),
              ),
              if (controller.stepIndex.value != 2)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
                  child: PrimaryButton(
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
                    text: controller.stepIndex.value == 1 ? 'done'.tr : 'continue'.tr,
                    onPressed: () {
                      if (!controller.canContinue) {
                        Get.snackbar(
                          "Error",
                          "Please select a date, time and payment method",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      if (argAppointment != null) {
                        controller.appointment.value = argAppointment!;
                      }
                      if (controller.stepIndex.value == 1) {
                        final id = controller.appointment.value.id;
                        if (id != null && id.isNotEmpty) {
                          controller.submitReschedule(appointmentId: id);
                        } else {
                          Get.snackbar(
                            'Error',
                            'Appointment ID not found',
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      } else {
                        controller.next();
                      }
                    },
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
