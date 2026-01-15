import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_colors.dart';
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
  final VoidCallback onTap;

  const _CardRow({
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final title = method.label;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 42.w),
            child: Row(
              children: [
                _CardLogo(icon: method.icon),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 42.w),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.black.withOpacity(.10),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardLogo extends StatelessWidget {
  final String icon;
  const _CardLogo({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 34.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: icon.isNotEmpty
          ? SvgPicture.asset(icon)
          : Icon(
              Icons.credit_card,
              size: 18.sp,
              color: Colors.black.withOpacity(.45),
            ),
    );
  }
}
