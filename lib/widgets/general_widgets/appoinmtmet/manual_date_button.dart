import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class ManualDateButton extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onPicked;

  const ManualDateButton({
    super.key,
    required this.initialDate,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialDate: initialDate,
        );
        if (picked != null) {
          onPicked(picked);
        }
      },
      child: Text(
        'set_manual'.tr,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
          height: 1.35,
        ),
      ),
    );
  }
}
