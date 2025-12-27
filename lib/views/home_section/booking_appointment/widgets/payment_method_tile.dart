import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../models/payment_method.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            _RadioDot(selected: selected),
            SizedBox(width: 12.w),
            Text(method.label, style: CustomTextStyles.label14Semi),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  const _RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    final border = selected ? AppColors.primary : Colors.blueGrey.shade200;
    final fill = selected ? AppColors.primary : Colors.transparent;

    return Container(
      width: 22.w,
      height: 22.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 2.w),
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
