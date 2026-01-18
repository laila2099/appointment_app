import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../model/inbox_model.dart';

class InboxItem extends StatelessWidget {
  final InboxModel model;
  final VoidCallback? onTap;

  const InboxItem({
    super.key,
    required this.model,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 12.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.light2Grey,
              backgroundImage: AssetImage(model.image),
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 197.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            height: 1.5.h),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        model.speciality,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.infoText,
                            height: 1.5.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    model.message,
                    style: TextStyle(
                      fontSize: 13.sp,
                      height: 1.6,
                      letterSpacing: .5.sp,
                      color: AppColors.subtitle,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  model.time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.lightGrey,
                  ),
                ),
                SizedBox(height: 6.h),
                if (model.unreadCount > 0)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      model.unreadCount.toString(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
