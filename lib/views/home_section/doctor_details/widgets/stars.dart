import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/app_icons.dart';

class Stars extends StatelessWidget {
  final int value;
  const Stars(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final filled = i < value;
        return filled
            ? SvgPicture.asset(
                AppIcons.star,
                height: 20.w,
                width: 20.w,
              )
            : Icon(
                Icons.star_border,
                size: 20.sp,
                color: Colors.amber,
              );
      }),
    );
  }
}
