import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateWheelController extends GetxController {
  DateWheelController({
    required List<DateTime> dates,
    DateTime? initialSelected,
    this.onChanged,
    this.visibleCount = 5,
  }) {
    availableDates.assignAll(dates);
    centeredDateIndex.value = _findDateIndex(initialSelected ?? dates.first);

    datePageController = PageController(
      initialPage: centeredDateIndex.value,
      viewportFraction: 0.26,
    );

    datePageController.addListener(_onDateWheelScroll);
  }

  final viewportFraction = 0.19.obs;

  final int visibleCount;
  final ValueChanged<DateTime>? onChanged;

  final availableDates = <DateTime>[].obs;
  final centeredDateIndex = 0.obs;

  late final PageController datePageController;

  void setCenteredIndex(int i) {
    if (availableDates.isEmpty) return;

    centeredDateIndex.value = i.clamp(0, availableDates.length - 1);
    onChanged?.call(availableDates[centeredDateIndex.value]);
  }

  void step(int delta) {
    if (availableDates.isEmpty) return;

    final next = (centeredDateIndex.value + delta).clamp(
      0,
      availableDates.length - 1,
    );

    setCenteredIndex(next);

    datePageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  void setDates(List<DateTime> dates, {DateTime? keepSelected}) {
    availableDates.assignAll(dates);
    centeredDateIndex.value = _findDateIndex(
      keepSelected ?? availableDates.first,
    );

    if (datePageController.hasClients) {
      datePageController.jumpToPage(centeredDateIndex.value);
    }
    onChanged?.call(availableDates[centeredDateIndex.value]);
  }

  int _findDateIndex(DateTime d) {
    final idx = availableDates.indexWhere(
      (x) => x.year == d.year && x.month == d.month && x.day == d.day,
    );
    return idx == -1 ? 0 : idx;
  }

  void _onDateWheelScroll() {
    final p = datePageController.page;
    if (p == null || availableDates.isEmpty) return;

    final idx = p.round().clamp(0, availableDates.length - 1);
    if (idx != centeredDateIndex.value) {
      setCenteredIndex(idx);
    }
  }

  @override
  void onClose() {
    datePageController.removeListener(_onDateWheelScroll);
    datePageController.dispose();
    super.onClose();
  }
}
