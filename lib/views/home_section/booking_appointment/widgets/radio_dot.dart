import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';

class RadioDot extends StatelessWidget {
  final bool selected;
  const RadioDot({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    final border = selected
        ? AppColors.primary.withOpacity(.4)
        : Colors.blueGrey.shade200;
    final fill = selected ? AppColors.primary : Colors.transparent;

    return Container(
      width: 22.w,
      height: 22.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1.w),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 10.w,
        height: 10.h,
        decoration: BoxDecoration(shape: BoxShape.circle, color: fill),
      ),
    );
  }
}
