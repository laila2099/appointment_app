import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final double size;
  final Color borderColor;

  const SocialButton({
    super.key,
    required this.imagePath,
    this.onTap,
    this.size = 52,
    this.borderColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
