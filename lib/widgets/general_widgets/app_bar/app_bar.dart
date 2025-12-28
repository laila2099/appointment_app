import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titel;
  final bool showAction;
  final VoidCallback? onactiontap;
  final Widget? actionicon;

  const CustomAppBar({
    super.key,
    required this.titel,
    this.showAction = false,
    this.onactiontap,
    this.actionicon,
  });

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        titel,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
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
              border: Border.all(color: AppColors.lighgrey, width: 1.5.w),
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
        Padding(
          padding: EdgeInsets.all(8.r),
          child: InkWell(
            onTap: onactiontap,
            borderRadius: BorderRadius.circular(8.r),
            child: showAction
                ? Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsets.all(2.r),
                    decoration: showAction
                        ? BoxDecoration(
                            border: Border.all(
                              color: AppColors.lighgrey,
                              width: 1.5.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          )
                        : null,
                    child: actionicon,
                  )
                : actionicon,
          ),
        ),
      ],
    );
  }
}
