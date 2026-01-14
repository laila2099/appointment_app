import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/classes/utils/date_text.dart';
import '../../../core/constant/app_colors.dart';
import '../../../views/home_section/booking_appointment/booking_appointment_controller/date_wheel_controller.dart';

class CenterSnapDatePicker extends StatelessWidget {
  final double itemHeight;
  final EdgeInsetsGeometry padding;
  final DateWheelController controller;

  const CenterSnapDatePicker({
    super.key,
    this.itemHeight = 62,
    this.padding = EdgeInsetsDirectional.zero,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final idx = controller.centeredDateIndex.value;
      final canLeft = idx > 0;
      final canRight = idx < controller.availableDates.length - 1;

      return Padding(
        padding: padding,
        child: Row(
          children: [
            _Arrow(
              icon: Icons.arrow_back_ios_new,
              enabled: canLeft,
              onTap: () => controller.step(-1),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: SizedBox(
                height: itemHeight * 1.45,
                child: PageView.builder(
                  controller: controller.datePageController,
                  itemCount: controller.availableDates.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (i) => controller.setCenteredIndex(i),
                  itemBuilder: (_, i) {
                    final d = controller.availableDates[i];

                    final current = controller.datePageController.hasClients
                        ? (controller.datePageController.page ?? idx.toDouble())
                        : idx.toDouble();

                    final dist = (i - current).abs().clamp(0.0, 1.0);
                    final scale = 1.18 - (dist * 0.12);
                    final selected = i == idx;

                    return Center(
                      child: Transform.scale(
                        scale: scale,
                        alignment: AlignmentDirectional.center,
                        child: _DateChip(
                          date: d,
                          height: itemHeight.h,
                          selected: selected,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 10.w),
            _Arrow(
              icon: Icons.arrow_forward_ios,
              enabled: canRight,
              onTap: () => controller.step(1),
            ),
          ],
        ),
      );
    });
  }
}

class _Arrow extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _Arrow({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: Icon(
          icon,
          size: 18.sp,
          color: enabled ? Colors.black : Colors.black.withOpacity(.25),
        ),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final DateTime date;
  final double height;
  final bool selected;

  const _DateChip({
    required this.date,
    required this.height,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final dayName = DateText.weekdayLabel(date.weekday);
    final dayNum = date.day.toString().padLeft(2, '0');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      height: selected ? height.h : 48.h,
      width: selected ? 55.w : 43.w,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2F6BFF) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: Colors.blue.withOpacity(.22),
                  blurRadius: 14.r,
                  offset: const Offset(0, 1),
                ),
              ]
            : [],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dayName,
              style: TextStyle(
                fontSize: selected ? 15.sp : 12.sp,
                height: 1.0,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : AppColors.textField,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              dayNum,
              style: TextStyle(
                fontSize: selected ? 15.sp : 14.sp,
                height: 1.0,
                fontWeight: FontWeight.w800,
                color: selected ? Colors.white : Colors.black.withOpacity(.35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
