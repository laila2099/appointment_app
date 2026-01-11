import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';

class StepperHeader extends StatelessWidget {
  final int activeIndex;
  const StepperHeader({super.key, required this.activeIndex});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 46),
      child: Row(
        children: [
          _StepDot(index: 0, activeIndex: activeIndex, label: 'date_time'.tr),
          _Line(active: activeIndex >= 1),
          _StepDot(index: 1, activeIndex: activeIndex, label: 'payment'.tr),
          _Line(active: activeIndex >= 2),
          _StepDot(index: 2, activeIndex: activeIndex, label: 'summary'.tr),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  final bool active;
  const _Line({required this.active});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        color: active ? Colors.green : Colors.grey.shade300,
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final int index;
  final int activeIndex;
  final String label;

  const _StepDot({
    required this.index,
    required this.activeIndex,
    required this.label,
  });

  bool get isDone => activeIndex > index;
  bool get isActive => activeIndex == index;

  @override
  Widget build(BuildContext context) {
    final Color fill = isDone
        ? AppColors.green
        : (isActive ? AppColors.primary : Colors.grey.shade200);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(color: fill, shape: BoxShape.circle),
          alignment: AlignmentDirectional.center,
          child: Text(
            '${index + 1}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: isDone
                ? AppColors.green
                : isActive
                    ? AppColors.black
                    : Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
