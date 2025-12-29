import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../../../../core/constant/app_colors.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/text_style.dart';
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
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
<<<<<<< HEAD
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
=======
      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 0),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => SizedBox(height: 24.h),
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
      itemBuilder: (_, i) {
        final r = reviews[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
<<<<<<< HEAD
              radius: 24,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 12),
=======
              radius: 24.r,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            SizedBox(width: 12.w),
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          r.userName,
<<<<<<< HEAD
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
=======
                          style: CustomTextStyles.sectionTitle,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
                        ),
                      ),
                      Text(
                        r.dateLabel,
<<<<<<< HEAD
                        style: const TextStyle(
                          color: AppColors.subtitle,
                          fontSize: 12,
=======
                        style: TextStyle(
                          color: AppColors.subtitle,
                          fontSize: 12.sp,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
                          letterSpacing: .4,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 10),
                  Stars(r.stars),
                  const SizedBox(height: 10),
                  Text(
                    r.comment,
                    style: const TextStyle(
                      color: AppColors.subtitle,
                      fontSize: 12,
=======
                  SizedBox(height: 10.h),
                  Stars(r.stars),
                  SizedBox(height: 10.h),
                  Text(
                    r.comment,
                    style: TextStyle(
                      color: AppColors.subtitle,
                      fontSize: 12.sp,
>>>>>>> b23f4ceb15782ec67744af3d30a98a8c5da46a9c
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
