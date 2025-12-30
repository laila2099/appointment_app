import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String department;
  final String hospital;
  final double rating;
  final int reviews;
  final bool shadow;
  final double? height;
  final void Function()?  onTap;

  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.department,
    required this.hospital,
    required this.rating,
    required this.reviews,
    this.shadow = false,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedReviews = NumberFormat('#,###').format(reviews);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 130.h,
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 16),
      
            // النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // اسم الدكتور
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      
                  const SizedBox(height: 6),
      
                  // التخصص + المستشفى
                  Row(
                    children: [
                      Text(
                        department,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Text("  |  ", style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: Text(
                          hospital,
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 6),
      
                  // التقييم والريڤيوز
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        "$rating ($formattedReviews reviews)",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
