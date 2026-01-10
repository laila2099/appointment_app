import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final String icon;
  final Color circle;
  bool isActive;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.circle,
    this.isActive = false,
  });
}

