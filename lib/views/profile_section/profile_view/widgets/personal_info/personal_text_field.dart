import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalTextField extends StatelessWidget {
  final String text;

  const PersonalTextField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      padding:
          EdgeInsets.only(top: 16.h, bottom: 16.h, left: 18.w, right: 18.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFF),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: const Color(0xffEEEEEE)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF242424),
            )),
      ),
    );
  }
}
