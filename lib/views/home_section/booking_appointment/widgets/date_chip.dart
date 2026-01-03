import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';

class DateChip extends StatelessWidget {
  final DateTime date;
  final bool selected;
  final VoidCallback onTap;

  const DateChip({
    super.key,
    required this.date,
    required this.selected,
    required this.onTap,
  });

  String get _dow {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }

  String get _dd => date.day.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final bg = selected ? AppColors.primary : Colors.grey.shade100;
    final fg = selected ? Colors.white : Colors.grey;

    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: onTap,
      child: Container(
        width: 64.w,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_dow,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: bg,
                )),
            SizedBox(height: 6.h),
            Text(_dd,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: fg,
                )),
          ],
        ),
      ),
    );
  }
}
