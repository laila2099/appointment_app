import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTime(BuildContext context, DateTime date, TimeOfDay time) {
  final locale = Localizations.localeOf(context).toString();

  final dateText = DateFormat('EEEE, dd MMM yyyy', locale).format(date);

  final timeText = DateFormat(
    'hh.mm a',
    locale,
  ).format(DateTime(date.year, date.month, date.day, time.hour, time.minute));

  return '$dateText\n$timeText';
}
