import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBadge extends StatelessWidget {
  final String? svgAsset;
  final IconData? icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double radius;
  final double iconSize;

  const IconBadge({
    super.key,
    this.svgAsset,
    this.icon,
    required this.backgroundColor,
    this.iconColor = Colors.white,
    this.size = 44,
    this.radius = 18,
    this.iconSize = 22,
  }) : assert(
          svgAsset != null || icon != null,
          'You must provide either svgAsset or icon',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius.r),
      ),
      alignment: AlignmentDirectional.center,
      child: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    if (svgAsset != null) {
      return SvgPicture.asset(
        svgAsset!,
        width: iconSize.w,
        height: iconSize.h,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    }

    return Icon(icon, size: iconSize.sp, color: iconColor);
  }
}
