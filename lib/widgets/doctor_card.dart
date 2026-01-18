import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../core/constant/app_icons.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String department;
  final String hospital;
  final double rating;
  final int reviews;
  final bool shadow;
  final double? height;
  final void Function()? onTap;
  final double? widthimage;
  final double? heightimage;

  DoctorCard({
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
    this.widthimage,
    this.heightimage,
  });

  Widget _buildImage(
      {required String image, required double width, required double height}) {
    // Determine if it's a network URL or asset path
    final isNetworkUrl = image.startsWith('http://') ||
        image.startsWith('https://') ||
        image.startsWith('/storage/') ||
        (image.startsWith('/') && !image.startsWith('assets/'));

    if (isNetworkUrl) {
      // Handle network images (including relative paths from API)
      String imageUrl = image;

      // If it's a relative path, it should already have base URL prepended by getImagePath
      // But handle case where it might not
      if (imageUrl.startsWith('/') && !imageUrl.startsWith('http')) {
        // This shouldn't happen if getImagePath works correctly, but handle it anyway
        return _buildPlaceholder(width: width, height: height);
      }

      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // If network image fails, show placeholder with person icon
          return _buildPlaceholder(width: width, height: height);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            ),
          );
        },
      );
    }

    // Otherwise, treat as asset image
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // If asset fails, show placeholder
        return _buildPlaceholder(width: width, height: height);
      },
    );
  }

  Widget _buildPlaceholder({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(Icons.person, color: Colors.grey, size: 40.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedReviews = NumberFormat('#,###').format(reviews);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 130.h,
        padding: EdgeInsetsDirectional.only(bottom: 8.h, start: 8.w, top: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
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
            SizedBox(
              width: widthimage ?? 110.w,
              height: heightimage ?? 110.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: _buildImage(
                  image: image,
                  width: widthimage ?? 110.w,
                  height: heightimage ?? 110.h,
                ),
              ),
            ),

            SizedBox(width: 16.h),

            // النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // اسم الدكتور
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // التخصص + المستشفى
                  Row(
                    children: [
                      Text(
                        department,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("  |  ", style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: Text(
                          hospital,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  // التقييم والريڤيوز
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.star,
                        height: 16.w,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "$rating ($formattedReviews reviews)",
                        style: TextStyle(color: Colors.grey),
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
