import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../../widgets/general_widgets/app_header/header_button.dart';
import '../../../../widgets/general_widgets/app_header/header_title.dart';
import '../../../../widgets/general_widgets/primary_button.dart';
import '../booking_appointment_controller/booking_controller.dart';
import '../widgets/stepper_header.dart';
import '../widgets/summary_bottom_sheet.dart';
import 'steps/step_date_time.dart';
import 'steps/step_payment.dart';
import 'steps/step_summary.dart';

class BookingFlowScreen extends GetView<BookingController> {
  const BookingFlowScreen({super.key});

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
                center: HeaderTitle('book_appointment'.tr),
              ),
              SizedBox(height: 32.h),
              StepperHeader(activeIndex: controller.stepIndex.value),
              SizedBox(height: 20.h),

              Expanded(
                child: IndexedStack(
                  index: controller.stepIndex.value,
                  children: const [
                    StepDateTime(),
                    StepPayment(),
                    StepSummary(),
                  ],
                ),
              ),

              if (controller.stepIndex.value != 2)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 16.h),
                  child: PrimaryButton(
                    text: 'continue'.tr,
                    onPressed: controller.stepIndex.value == 2
                        ? () {}
                        : controller.next,
                  ),
                ),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        final show = controller.stepIndex.value == 2;
        if (!show) return const SizedBox.shrink();

        return SummaryBottomSheet(subtotal: 3456, tax: 33);
      }),
    );
  }
}
