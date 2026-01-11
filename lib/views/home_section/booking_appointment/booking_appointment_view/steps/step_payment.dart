import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../models/payment_method.dart';
import '../../../../../widgets/general_widgets/section_title.dart';
import '../../booking_appointment_controller/booking_controller.dart';
import '../../widgets/radio_dot.dart';

class StepPayment extends StatelessWidget {
  const StepPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BookingController>();

    return Obx(() {
      if (c.paymentLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (c.paymentError.value != null) {
        return Padding(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Text(
            c.paymentError.value!,
            style: const TextStyle(color: Colors.red),
          ),
        );
      }

      final selectedType = c.paymentCategory.value;
      final hasCards = c.cardMethods.isNotEmpty;

      return ListView(
        padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 10.h),
        children: [
          SizedBox(height: 8.h),
          SectionTitle('payment_option'.tr),
          SizedBox(height: 24.h),
          _RadioRow(
            title: 'credit_card'.tr,
            selected: selectedType == 'card',
            enabled: hasCards,
            onTap: hasCards ? () => c.selectCategory('card') : null,
          ),
          if (selectedType == 'card' && hasCards) ...[
            SizedBox(height: 10.h),
            ...c.cardMethods.map(
              (m) => _CardRow(
                method: m,
                selected: c.selectedPayment.value?.id == m.id,
                onTap: () => c.selectPayment(m),
              ),
            ),
            SizedBox(height: 10.h),
          ],
          SizedBox(height: 24.h),
          _RadioRow(
            title: 'bank_transfer'.tr,
            selected: selectedType == 'bank',
            enabled: c.bankMethod != null,
            onTap: c.bankMethod == null ? null : () => c.selectCategory('bank'),
          ),
          SizedBox(height: 24.h),
          _RadioRow(
            title: 'paypal'.tr,
            selected: selectedType == 'paypal',
            enabled: c.paypalMethod != null,
            onTap: c.paypalMethod == null
                ? null
                : () => c.selectCategory('paypal'),
          ),
        ],
      );
    });
  }
}

class _RadioRow extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;
  final bool enabled;

  const _RadioRow({
    required this.title,
    required this.selected,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = enabled ? Colors.black : Colors.black.withOpacity(.35);

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Opacity(
              opacity: enabled ? 1 : .45,
              child: RadioDot(selected: selected),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  const _CardRow({
    required this.method,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = (method.last4 == null || method.last4!.isEmpty)
        ? ''
        : '•••• ${method.last4}';

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 42.w),
            child: Row(
              children: [
                Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.credit_card, size: 18.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    subtitle.isEmpty
                        ? method.label
                        : '${method.label}  $subtitle',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(12.r),
                  child: RadioDot(selected: selected),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 42.w),
            child: Divider(height: 18.h, color: Colors.grey.withOpacity(.2)),
          ),
        ],
      ),
    );
  }
}
