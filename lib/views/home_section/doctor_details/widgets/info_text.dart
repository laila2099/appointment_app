import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';

class InfoText extends StatelessWidget {
  final String text;
  final bool emphasis;

  const InfoText(this.text, {super.key, this.emphasis = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: emphasis ? FontWeight.w500 : FontWeight.w400,
        color: emphasis ? AppColors.black : AppColors.subtitle,
        letterSpacing: 0.5,
        wordSpacing: 0.5,
        height: 1.6,
      ),
    );
  }
}
