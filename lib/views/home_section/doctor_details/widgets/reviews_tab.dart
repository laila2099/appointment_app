import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, i) {
        final r = reviews[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 12),
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
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Text(
                        r.dateLabel,
                        style: const TextStyle(
                          color: AppColors.subtitle,
                          fontSize: 12,
                          letterSpacing: .4,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Stars(r.stars),
                  const SizedBox(height: 10),
                  Text(
                    r.comment,
                    style: const TextStyle(
                      color: AppColors.subtitle,
                      fontSize: 12,
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
