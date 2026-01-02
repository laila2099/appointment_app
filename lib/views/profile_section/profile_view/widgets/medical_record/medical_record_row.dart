import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'medical_record_item.dart';

class MedicalRecordRow extends StatelessWidget {
  final String date;
  final String title;
  final List<String> details;

  const MedicalRecordRow({
    super.key,
    required this.date,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF757575),
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: MedicalRecordItem(
              title: title,
              details: details,
            ),
          ),
        ],
      ),
    );
  }
}
