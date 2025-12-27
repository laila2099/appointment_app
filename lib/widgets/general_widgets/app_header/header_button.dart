import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const HeaderButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.black.withOpacity(0.06)),
        ),
        child: child,
      ),
    );
  }
}
