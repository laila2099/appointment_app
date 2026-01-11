import 'package:flutter/material.dart';

class Appointment {
  final String? id;
  final String doctorId;
  final DateTime appointmentDate;
  final TimeOfDay appointmentTime;
  final String paymentMethod;
  final String appointmentType;

  const Appointment({
    this.id,
    required this.doctorId,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.paymentMethod,
    required this.appointmentType,
  });

  Appointment copyWith({
    String? id,
    DateTime? appointmentDate,
    TimeOfDay? appointmentTime,
    String? paymentMethod,
    String? appointmentType,
  }) {
    return Appointment(
      id: id ?? this.id,
      doctorId: doctorId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      appointmentType: appointmentType ?? this.appointmentType,
    );
  }

  Map<String, dynamic> toJsonCreate() {
    return {
      if (id != null) 'id': id,
      'doctor_id': doctorId,
      'appointment_date':
      appointmentDate.toIso8601String().split('T').first.toString(),
      'appointment_time':
      '${appointmentTime.hour.toString().padLeft(2, '0')}:${appointmentTime.minute.toString().padLeft(2, '0')}'
          .toString(),
      'payment_method': paymentMethod,
    };
  }


  factory Appointment.fromJson(Map<String, dynamic> json) {
    final timeString = (json['appointment_time'] ?? '00:00') as String;
    final parts = timeString.split(':');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;

    return Appointment(
      id: json['id'] as String?,
      doctorId: json['doctor_id'] as String,
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
      appointmentTime: TimeOfDay(hour: hour, minute: minute),
      paymentMethod: (json['payment_method'] ?? '') as String,
      appointmentType: (json['appointment_type'] ?? '') as String,
    );
  }


}