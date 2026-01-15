import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  final double size;
  final Color? backgroundColor;

  const SocialButton({
    super.key,
    required this.imagePath,
    this.onTap,
    this.size = 52,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFFf9f9f9),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
