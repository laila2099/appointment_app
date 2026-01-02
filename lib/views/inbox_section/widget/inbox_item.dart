import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';
import '../model/inbox_model.dart';

class InboxItem extends StatelessWidget {
  final InboxModel model;

  const InboxItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          /// 👤 Avatar
          CircleAvatar(
            radius: 26.r,
            backgroundColor: AppColors.light2Grey,
            backgroundImage: AssetImage(model.image),
          ),

          SizedBox(width: 12.w),

          /// 📝 Name + Message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  model.message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          /// ⏰ Time + Badge
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
                  padding: EdgeInsets.all(6.r),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    model.unreadCount.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
