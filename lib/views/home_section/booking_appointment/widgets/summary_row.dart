import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_style.dart';
import '../../../../widgets/general_widgets/icon_badge.dart';

class SummaryRow extends StatelessWidget {
  final String svgAsset;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;

  const SummaryRow({
    super.key,
    required this.svgAsset,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(.06)),
        ),
      ),
      child: Row(
        children: [
          IconBadge(
            svgAsset: svgAsset,
            backgroundColor: iconBg,
            iconColor: iconColor,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: CustomTextStyles.label14Semi),
                    SizedBox(height: 4.h),
                    Text(subtitle, style: CustomTextStyles.body12),
                  ],
                ),
                if (trailing != null) ...[SizedBox(width: 12.w), trailing!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
