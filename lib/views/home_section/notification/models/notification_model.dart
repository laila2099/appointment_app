
import 'package:flutter/material.dart';

enum NotificationSection { today, yesterday }

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final String icon;
  final Color circle;
  bool isActive;
  final NotificationSection section;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.circle,
    this.isActive = false,
    this.section = NotificationSection.today,
  });
}
