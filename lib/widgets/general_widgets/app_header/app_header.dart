import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget? center;
  final Widget? trailing;

  final double height;

  final EdgeInsetsGeometry padding;

  final Color backgroundColor;
  final Color iconColor;

  final bool reserveSpace;
  final bool showBorder;

  const AppHeader({
    super.key,
    this.center,
    this.trailing,
    this.height = 72,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.backgroundColor = Colors.white,
    this.reserveSpace = true,
    this.showBorder = true,
    this.iconColor = Colors.black,
  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    const double kBtnSize = 44;

    Widget placeholder() => SizedBox(width: kBtnSize.w, height: kBtnSize.w);

    final border =
        showBorder ? Border.all(color: Colors.black.withOpacity(0.06)) : null;
    final right = trailing ?? (reserveSpace ? placeholder() : const SizedBox());

    return Material(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height.h,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              (padding as EdgeInsets).left.w,
              14.h,
              (padding as EdgeInsets).right.w,
              14.h,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: Get.back,
                  borderRadius: BorderRadius.circular(14.r),
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(14.r),
                      border: border,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
                      color: iconColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: center ?? const SizedBox(),
                  ),
                ),
                right,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
