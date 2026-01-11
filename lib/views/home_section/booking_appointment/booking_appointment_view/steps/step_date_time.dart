import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../widgets/general_widgets/appoinmtmet/appointment_type_tile.dart';
import '../../../../../widgets/general_widgets/appoinmtmet/center_snap_date_picker.dart';
import '../../../../../widgets/general_widgets/appoinmtmet/manual_date_button.dart';
import '../../../../../widgets/general_widgets/appoinmtmet/time_slot_grid.dart';
import '../../../../../widgets/general_widgets/section_title.dart';
import '../../booking_appointment_controller/booking_controller.dart';
import '../../models/appointment_type.dart';

class StepDateTime extends StatelessWidget {
  const StepDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BookingController>();

    return Obx(() {
      final appointment = c.appointment.value;
      final selectedType = AppointmentTypeX.fromId(
        appointment.appointmentType,
      );

      return ListView(
        padding: EdgeInsetsDirectional.fromSTEB(20.w, 0.h, 20.w, 10.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionTitle('select_date'.tr),
              ManualDateButton(
                initialDate: appointment.appointmentDate,
                onPicked: c.selectDate,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CenterSnapDatePicker(controller: c.wheel),
          SizedBox(height: 24.h),
          SectionTitle('available_time'.tr),
          SizedBox(height: 24.h),
          TimeSlotGrid(
            times: c.availableTimes,
            selected: appointment.appointmentTime,
            onSelect: c.selectTime,
          ),
          SizedBox(height: 24.h),
          SectionTitle('appointment_type'.tr),
          SizedBox(height: 24.h),
          AppointmentTypeTile(
            type: AppointmentType.inPerson,
            selected: selectedType == AppointmentType.inPerson,
            onTap: () => c.selectType(AppointmentType.inPerson),
            color: AppColors.secondBlue,
            iconColor: AppColors.primary,
          ),
          AppointmentTypeTile(
            type: AppointmentType.videoCall,
            selected: selectedType == AppointmentType.videoCall,
            onTap: () => c.selectType(AppointmentType.videoCall),
            color: AppColors.secondGreen,
            iconColor: AppColors.green,
          ),
          AppointmentTypeTile(
            type: AppointmentType.phoneCall,
            selected: selectedType == AppointmentType.phoneCall,
            onTap: () => c.selectType(AppointmentType.phoneCall),
            color: AppColors.secondRed,
            iconColor: AppColors.red,
          ),
        ],
      );
    });
  }
}
