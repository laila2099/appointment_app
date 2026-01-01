import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/text_style.dart';


class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;

  const CustomPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height = 52,
    this.borderRadius = 16,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          label,
          style: CustomTextStyles.button,
        ),
      ),
    );
  }
}
