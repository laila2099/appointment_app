import 'package:flutter/material.dart';

import '../../../../models/doctor_model.dart';
import 'info_text.dart';
import 'section_title.dart';

class AboutTab extends StatelessWidget {
  final Doctor doctor;
  const AboutTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      children: [
        const SectionTitle("About me"),
        const SizedBox(height: 12),

        InfoText(doctor.about),

        const SizedBox(height: 24),

        const SectionTitle("Working Time"),
        const SizedBox(height: 12),

        InfoText(doctor.workingTime),

        const SizedBox(height: 24),

        const SectionTitle("STR"),
        const SizedBox(height: 12),

        InfoText(doctor.strNumber),

        const SizedBox(height: 24),

        const SectionTitle("Pengalaman Praktik"),
        const SizedBox(height: 12),
        InfoText(doctor.experiencePlace, emphasis: true),
        const SizedBox(height: 16),
        InfoText(doctor.experiencePeriod),
      ],
    );
  }
}
