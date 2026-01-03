import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? center;
  final Widget? trailing;

  final double height;

  final EdgeInsetsGeometry padding;

  final Color backgroundColor;

  final bool reserveSpace;

  const AppHeader({
    super.key,
    this.leading,
    this.center,
    this.trailing,
    this.height = 72,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.backgroundColor = Colors.white,
    this.reserveSpace = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    const double kBtnSize = 44;

    Widget placeholder() => SizedBox(width: kBtnSize.w, height: kBtnSize.w);

    final left = leading ?? (reserveSpace ? placeholder() : const SizedBox());
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
                left,
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
