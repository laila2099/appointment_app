import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget center;
  final Widget trailing;

  final double height;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  const AppHeader({
    super.key,
    required this.leading,
    required this.center,
    required this.trailing,
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
          height: height,
          padding: padding,
          child: Row(
            children: [
              SizedBox(width: 44, height: 44, child: leading),
              const SizedBox(width: 12),
              Expanded(child: Center(child: center)),
              const SizedBox(width: 12),
              SizedBox(width: 44, height: 44, child: trailing),
            ],
          ),
        ),
      ),
    );
  }
}
