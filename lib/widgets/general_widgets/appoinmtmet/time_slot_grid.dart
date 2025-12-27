import 'package:flutter/material.dart';

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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
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
