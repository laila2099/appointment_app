import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titel;
  final String? subTitle;
  final bool showAction;
  final VoidCallback? onactiontap;
  final Widget? actionicon;
  final double? width, height;
  final bool showActionBorder;
  final bool showBack;

  const CustomAppBar({
    super.key,
    required this.titel,
    this.subTitle,
    this.showAction = false,
    this.onactiontap,
    this.actionicon,
    this.width,
    this.height,
    this.showActionBorder = true,
    this.showBack = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  void _handleBack() {
    final navCtrl = Get.find<NavigationController>();

    if (Get.key.currentState?.canPop() ?? false) {
      Get.back(result: true);
    } else {
      navCtrl.handleBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titel,
              style: TextStyle(
                fontSize: 18.sp,
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
        leading: showBack
            ? Padding(
                padding: EdgeInsets.all(8.r),
                child: InkWell(
                  onTap: _handleBack,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    padding: EdgeInsets.only(left: 8.r),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.06),
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 22.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              )
            : null,
        actions: [
          if (showAction && actionicon != null)
            Padding(
              padding: EdgeInsets.all(8.r),
              child: InkWell(
                onTap: onactiontap,
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: width ?? 40.w,
                  height: height ?? 40.h,
                  decoration: BoxDecoration(
                    border: showActionBorder
                        ? Border.all(
                            color: Colors.black.withOpacity(0.06),
                            width: 1.5.w,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(child: actionicon),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
