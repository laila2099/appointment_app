import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';

class TimeSlotChip extends StatelessWidget {
  final TimeOfDay time;
  final bool selected;
  final VoidCallback onTap;

  const TimeSlotChip({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  String _format(TimeOfDay t) {
    final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final m = t.minute.toString().padLeft(2, '0');
    final ampm = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$h.$m $ampm';
  }

  @override
  Widget build(BuildContext context) {
    final bg = selected ? AppColors.primary : Colors.grey.shade100;
    final fg = selected ? Colors.white : Colors.grey.shade400;

    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        alignment: Alignment.center,
        child: Text(
          _format(time),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: fg,
          ),
        ),
      ),
    );
  }
}
