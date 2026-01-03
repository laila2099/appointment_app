import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';

class SortByBottomSheet extends StatelessWidget {
  const SortByBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Speciality',
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildFilterButton('All'),
              _buildFilterButton('General'),
              _buildFilterButton('Neurologic'),
              _buildFilterButton('Pediatric'),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Rating',
            style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildFilterButton('All', isStar: true),
              _buildFilterButton('5', isStar: true),
              _buildFilterButton('4', isStar: true),
              _buildFilterButton('3', isStar: true),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Done'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 50.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, {bool isStar = false}) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isStar && label == 'All' ? AppColors.white : AppColors.black,
          ),
        ),
        backgroundColor: isStar
            ? label == 'All'
            ? AppColors.primary
            : AppColors.secondBlue
            : AppColors.secondBlue,
      ),
    );
  }
}
