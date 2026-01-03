import 'package:flutter/material.dart';

class Appointment {
  final String doctorId;
  final DateTime date;
  final TimeOfDay time;
  final String appointmentTypeId;

  const Appointment({
    required this.doctorId,
    required this.date,
    required this.time,
    required this.appointmentTypeId,
  });

  Appointment copyWith({
    DateTime? date,
    TimeOfDay? time,
    String? appointmentTypeId,
  }) {
    return Appointment(
      doctorId: doctorId,
      date: date ?? this.date,
      time: time ?? this.time,
      appointmentTypeId: appointmentTypeId ?? this.appointmentTypeId,
    );
  }
}
