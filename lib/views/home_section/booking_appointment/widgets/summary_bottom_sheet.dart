import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/general_widgets/primary_button.dart';

class SummaryBottomSheet extends StatelessWidget {
  final num subtotal;
  final num tax;

  const SummaryBottomSheet({
    super.key,
    required this.subtotal,
    required this.tax,
  });

  num get total => subtotal + tax;

  String _money(num v) => '\$${v.toStringAsFixed(0)}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.10),
              blurRadius: 28.r,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.10),
                borderRadius: BorderRadius.circular(999.r),
              ),
            ),
            SizedBox(height: 14.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('payment_info'.tr, style: CustomTextStyles.label14),
            ),
            SizedBox(height: 12.h),
            _TotalRow(label: 'subtotal'.tr, value: _money(subtotal)),
            SizedBox(height: 10.h),
            _TotalRow(label: 'tax'.tr, value: _money(tax)),
            SizedBox(height: 14.h),
            Divider(color: Colors.black.withOpacity(.08), height: 1.h),
            SizedBox(height: 14.h),
            _TotalRow(
              label: 'payment_total'.tr,
              value: _money(total),
              bold: true,
            ),
            SizedBox(height: 16.h),
            PrimaryButton(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
              text: 'book_now'.tr,
              onPressed: () {
                Get.toNamed(AppRoutes.bookingConfirmed);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _TotalRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? 16.sp : 14.sp,
      fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
      color: AppColors.black,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style.copyWith(color: AppColors.subtitle)),
        Text(value, style: style),
      ],
    );
  }
}
