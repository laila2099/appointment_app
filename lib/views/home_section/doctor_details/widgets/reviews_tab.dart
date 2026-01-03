import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../models/review_model.dart';
import 'stars.dart';

class ReviewsTab extends StatelessWidget {
  final List<Review> reviews;
  const ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(child: Text("No reviews yet"));
    }

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => SizedBox(height: 24.h),
      itemBuilder: (_, i) {
        final r = reviews[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          r.userName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Text(
                        r.dateLabel,
                        style: TextStyle(
                          color: AppColors.subtitle,
                          fontSize: 12.sp,
                          letterSpacing: .4,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Stars(r.stars),
                  SizedBox(height: 10.h),
                  Text(
                    r.comment,
                    style: TextStyle(
                      color: AppColors.subtitle,
                      fontSize: 12.sp,
                      letterSpacing: .4,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
