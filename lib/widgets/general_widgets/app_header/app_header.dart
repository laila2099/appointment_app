import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
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
  final bool showBack;

  final VoidCallback? onBack;

  const AppHeader({
    super.key,
    this.center,
    this.trailing,
    this.height = 72,
    this.padding = const EdgeInsetsDirectional.symmetric(horizontal: 20),
    this.backgroundColor = Colors.white,
    this.reserveSpace = true,
    this.showBorder = true,
    this.iconColor = Colors.black,
    this.showBack = true,
    this.onBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    final navCtrl = Get.find<NavigationController>();
    const double kBtnSize = 44;

    Widget placeholder() => SizedBox(width: kBtnSize.w, height: kBtnSize.w);

    final border =
        showBorder ? Border.all(color: Colors.black.withOpacity(0.06)) : null;

    return Material(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height.h,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              (padding as EdgeInsetsDirectional).start.w,
              14.h,
              (padding as EdgeInsetsDirectional).end.w,
              14.h,
            ),
            child: Row(
              children: [
                if (showBack)
                  InkWell(
                    onTap: onBack ??
                        () {
                          navCtrl.handleBack();
                        },
                    borderRadius: BorderRadius.circular(14.r),
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      alignment: AlignmentDirectional.center,
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
                  )
                else if (reserveSpace)
                  placeholder(),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: center ?? const SizedBox(),
                  ),
                ),
                trailing ?? (reserveSpace ? placeholder() : const SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
