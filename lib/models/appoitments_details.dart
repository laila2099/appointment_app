import 'package:flutter/material.dart';
import 'appointment_model.dart';

enum AppointmentStatus { upcoming, completed, cancelled }

class AppointmentDetailsModel {
  final String id;
  final String doctorId;
  final String doctorName;
  final String specialty;
  final String clinic;
  final DateTime appointmentDateTime;
  final DateTime createdAt;
  final AppointmentStatus status;
  final double rating;
  final int reviewsCount;

  const AppointmentDetailsModel({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.clinic,
    required this.appointmentDateTime,
    required this.createdAt,
    required this.status,
    this.rating = 0,
    this.reviewsCount = 0,
  });

factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
  final date = json['appointment_date'];
  final time = json['appointment_time'];
  final dateTime = DateTime.parse('$date $time');

  return AppointmentDetailsModel(
    id: json['appointment_id'],
    doctorId: json['doctor_id'],
    doctorName: json['doctor_name'],
    specialty: json['specialization'],
    clinic: json['location'],
    appointmentDateTime: dateTime,
    createdAt: DateTime.parse(json['created_at']),
    status: _mapStatus(json['status']),
    rating: 0,
    reviewsCount: 0,
  );
}

static AppointmentStatus _mapStatus(String value) {
  switch (value) {
    case 'completed':
      return AppointmentStatus.completed;
    case 'canceled':
      return AppointmentStatus.cancelled;
    default:
      return AppointmentStatus.upcoming;
  }
}


  AppointmentDetailsModel copyWith({
    String? id,
    String? doctorId,
    String? doctorName,
    String? specialty,
    String? clinic,
    DateTime? appointmentDateTime,
    DateTime? createdAt,
    AppointmentStatus? status,
    double? rating,
    int? reviewsCount,
  }) {
    return AppointmentDetailsModel(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      specialty: specialty ?? this.specialty,
      clinic: clinic ?? this.clinic,
      appointmentDateTime: appointmentDateTime ?? this.appointmentDateTime,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
    );
  }
  Appointment toAppointmentModel() {
    return Appointment(
      id: id,
      doctorId: doctorId,
      appointmentDate: DateTime(
        appointmentDateTime.year,
        appointmentDateTime.month,
        appointmentDateTime.day,
      ),
      appointmentTime: TimeOfDay(
        hour: appointmentDateTime.hour,
        minute: appointmentDateTime.minute,
      ),
      appointmentType: 'in_person',
      paymentMethod: '',
    );
  }
}


