import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../widget/custom_tab.dart';

class SortByBottomSheet extends StatefulWidget {
  const SortByBottomSheet({super.key});

  @override
  State<SortByBottomSheet> createState() => _SortByBottomSheetState();
}

class _SortByBottomSheetState extends State<SortByBottomSheet> {
  final List<String> specialities = [
    'All',
    'General',
    'Neurologic',
    'Pediatric'
  ];
  final List<String> ratings = ['All', '5', '4', '3'];

  String selectedSpeciality = 'All';
  String selectedRating = 'All';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5, // نص الصفحة
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Title
            Center(
              child: Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Speciality
            Text(
              'Speciality',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: specialities.map((spec) {
                  return CustomTab(
                    label: spec,
                    isSelected: selectedSpeciality == spec,
                    onTap: () {
                      setState(() {
                        selectedSpeciality = spec;
                      });
                    },
                    isSmall: true,
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h),

            // Rating
            Text(
              'Rating',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ratings.map((rate) {
                  bool isSelected = selectedRating == rate;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = rate;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.light2Grey,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16.sp,
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            rate,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            Spacer(),

            // Done button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
