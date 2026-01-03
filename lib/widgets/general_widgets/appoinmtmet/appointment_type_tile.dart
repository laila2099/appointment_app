import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_icons.dart';
import '../../../core/constant/text_style.dart';
import '../../../views/home_section/booking_appointment/models/appointment_type.dart';
import '../../../views/home_section/booking_appointment/widgets/radio_dot.dart';
import '../icon_badge.dart';

class AppointmentTypeTile extends StatelessWidget {
  final AppointmentType type;
  final bool selected;
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;

  const AppointmentTypeTile({
    super.key,
    required this.type,
    required this.selected,
    required this.onTap,
    required this.color,
    required this.iconColor,
  });

  String get _icon {
    switch (type) {
      case AppointmentType.inPerson:
        return AppIcons.profile;
      case AppointmentType.videoCall:
        return AppIcons.video;
      case AppointmentType.phoneCall:
        return AppIcons.call;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            IconBadge(
              svgAsset: _icon,
              backgroundColor: color,
              iconColor: iconColor,
            ),

            SizedBox(width: 12.w),
            Expanded(child: Text(type.label, style: CustomTextStyles.body14)),
            RadioDot(selected: selected),
          ],
        ),
      ),
    );
  }
}
