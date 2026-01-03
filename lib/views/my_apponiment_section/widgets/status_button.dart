import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonVariant { filled, stroke }

class StatusButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final Color color;

  const StatusButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 38.h,
        width: 148.w,
        child: variant == ButtonVariant.filled
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: AppColors.white,
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: onPressed,
                child: Text(label, style: CustomTextStyles.button12),
              )
            : OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: color, width: 1.5),
                  foregroundColor: color,
                  shape: const StadiumBorder(),
                ),
                onPressed: onPressed,
                child: Text(label, style: CustomTextStyles.outlinedButton12),
              ),
      ),
    );
  }
}
