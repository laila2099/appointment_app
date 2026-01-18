import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../widgets/general_widgets/icon_badge.dart';

class SummaryRow extends StatelessWidget {
  final String svgAsset;
  final Color? iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;

  const SummaryRow({
    super.key,
    required this.svgAsset,
    this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(.06)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconBadge(
            svgAsset: svgAsset,
            backgroundColor: iconBg ?? Colors.transparent,
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
                    Text(title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        )),
                    SizedBox(height: 4.h),
                    Text(subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitle,
                        )),
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
