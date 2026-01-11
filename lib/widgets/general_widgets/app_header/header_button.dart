import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  final bool showBorder;

  final Color? backgroundColor;

  final double size;

  final double radius;

  const HeaderButton({
    super.key,
    required this.child,
    this.onTap,
    this.showBorder = true,
    this.backgroundColor,
    this.size = 44,
    this.radius = 14,
  });

  @override
  Widget build(BuildContext context) {
    final border =
        showBorder ? Border.all(color: Colors.black.withOpacity(0.06)) : null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius.r),
      child: Container(
        width: size.w,
        height: size.h,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius.r),
          border: border,
        ),
        child: Opacity(
          opacity: onTap == null ? 0.45 : 1,
          child: child,
        ),
      ),
    );
  }
}
