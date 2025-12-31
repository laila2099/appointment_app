import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_controller/booking_controller.dart';
import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_view/steps/step_date_time.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/reschedule_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_button.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../../../widgets/general_widgets/primary_button.dart';

class ReschedualScreen extends GetView<BookingController> {
  const ReschedualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              AppHeader(
                leading: HeaderButton(
                  onTap: Get.back,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.sp,
                    color: Colors.black,
                  ),
                ),
                center: HeaderTitle('Reschedual'),
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
                    text: controller.stepIndex.value == 1
                        ? 'done'.tr
                        : 'continue'.tr,
                    onPressed: controller.canContinue
                        ? controller.stepIndex.value == 1
                            ? controller.goBackAfterConfirmReschedule
                            : controller.next
                        : () => Get.snackbar(
                              "Error",
                              "Please select a date, time and payment method",
                              snackPosition: SnackPosition.BOTTOM,
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
