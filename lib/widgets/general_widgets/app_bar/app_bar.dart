import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titel;
  final String? subTitle;
  final bool showAction;
  final VoidCallback? onactiontap;
  final Widget? actionicon;
  final double? width, height;

  const CustomAppBar({
    super.key,
    required this.titel,
    this.subTitle,
    this.showAction = false,
    this.onactiontap,
    this.actionicon,
    this.width,
    this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,

      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true, // <-- النص بالمنتصف الآن
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // <-- لتوسيط النص
        children: [
          Text(
            titel,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle!,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
        ],
      ),
      leading: Padding(
        padding: EdgeInsets.all(8.r),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.only(left: 8.r),
            width: 40.w,
            height: 40.h,
            margin: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey, width: 1.5.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      actions: [
        if (showAction && actionicon != null)
          Padding(
            padding: EdgeInsets.all(8.r),
            child: InkWell(
              onTap: onactiontap,
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: width ?? 40.w,
                height: height ?? 40.h,
                child: Container(
                  margin: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGrey,
                      width: 1.5.w,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: actionicon,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
