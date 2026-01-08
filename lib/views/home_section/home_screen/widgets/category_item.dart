import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String title;

  const CategoryItem({super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF5F9FF),
          ),
          child: Center(
            child: _buildImage(),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          title,
          style: CustomTextStyles.specialitytext,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return ClipOval(
      child: Image.network(
        iconPath,
        height: 45.h,
        width: 45.w,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.category, size: 24.h);
        },
      ),
    );
  }
}
