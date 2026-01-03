import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'My Appointment',
                  style: CustomTextStyles.body14,
                ),
              ),
            ),
            VerticalDivider(
              indent: 6,
              endIndent: 6,
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Medical records',
                  style: CustomTextStyles.body14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
