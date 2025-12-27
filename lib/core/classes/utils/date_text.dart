class DateText {
  DateText._();

  static const List<String> _weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  static String weekdayLabel(int weekday) {
    return _weekdays[weekday % 7];
  }

  static String dayNumber(int day) {
    return day.toString().padLeft(2, '0');
  }
}
