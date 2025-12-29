import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c

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
<<<<<<< HEAD
        fontSize: 14,
=======
        fontSize: 14.sp,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
        fontWeight: emphasis ? FontWeight.w500 : FontWeight.w400,
        color: emphasis ? AppColors.black : AppColors.subtitle,
        letterSpacing: 0.5,
        wordSpacing: 0.5,
        height: 1.6,
      ),
    );
  }
}
