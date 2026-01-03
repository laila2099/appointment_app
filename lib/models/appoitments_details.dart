import 'package:get/get.dart';

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
    return AppointmentDetailsModel(
      id: json['id'],
      doctorId: json['doctor_id'],
      doctorName: json['doctor_name'],
      specialty: json['specialty'],
      clinic: json['clinic'],
      appointmentDateTime: DateTime.parse(json['appointment_datetime']),
      createdAt: DateTime.parse(json['created_at']),
      status: _mapStatus(json['status']),
      rating: json['rating']?.toDouble() ?? 0,
      reviewsCount: json['reviews_count'] ?? 0,
    );
  }

  static AppointmentStatus _mapStatus(String value) {
    switch (value) {
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.upcoming;
    }
  }

  // ========================================
  // copyWith لتعديل أي حقل بدون إنشاء كائن جديد بالكامل
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
}
