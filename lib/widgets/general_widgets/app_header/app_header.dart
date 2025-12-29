import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget center;
  final Widget? trailing;

  final double height;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  const AppHeader({
    super.key,
    required this.leading,
    required this.center,
    this.trailing,
    this.height = 72,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.backgroundColor = Colors.white,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: height.h,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 40.w, height: 40.h, child: leading),

              Expanded(child: Center(child: center)),
              if (trailing != null)
                SizedBox(width: 40.w, height: 40.h, child: trailing),
            ],
          ),
        ),
      ),
    );
  }
}
