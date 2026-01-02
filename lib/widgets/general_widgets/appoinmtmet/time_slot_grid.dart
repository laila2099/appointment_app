import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'time_slot_chip.dart';

class TimeSlotGrid extends StatelessWidget {
  final List<TimeOfDay> times;
  final TimeOfDay? selected;
  final ValueChanged<TimeOfDay> onSelect;

  const TimeSlotGrid({
    super.key,
    required this.times,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: times.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 3.3,
      ),
      itemBuilder: (_, i) {
        final t = times[i];
        return TimeSlotChip(
          time: t,
          selected: t == selected,
          onTap: () => onSelect(t),
        );
      },
    );
  }
}
