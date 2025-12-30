import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
    );
  }
}
