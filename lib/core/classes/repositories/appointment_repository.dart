import 'package:flutter/material.dart';
import '../../../models/appointment_model.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
import '../api/api_result.dart';

class AppointmentRepository {
  final ApiClient api;

  AppointmentRepository({required this.api});

  /// إنشاء موعد
  Future<ApiResult<Appointment>> createAppointment({
    required String accessToken,
    required Appointment appointment,
  }) {
    return api.post<Appointment>(
      endpoint: ApiEndpoints.createAppointment(),
      headers: {
        ...ApiHeaders.authed(accessToken),
        'Prefer': 'return=representation',
      },
      body: {
        'doctor_id': appointment.doctorId,
        'appointment_date':
        appointment.appointmentDate.toIso8601String().split('T').first,
        'appointment_time':
        '${appointment.appointmentTime.hour.toString().padLeft(2, '0')}:${appointment.appointmentTime.minute.toString().padLeft(2, '0')}',
        'payment_method': appointment.paymentMethod,
      },
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return Appointment.fromJson(json.first as Map<String, dynamic>);
        }
        if (json is Map<String, dynamic>) {
          return Appointment.fromJson(json);
        }
        if (json == null || (json is List && json.isEmpty)) {
          return appointment;
        }

        throw Exception('Unexpected response for createAppointment');
      },
    );
  }

  /// تعديل موعد
  Future<ApiResult<Appointment>> editAppointment({
    required String accessToken,
    required String appointmentId,
    DateTime? appointmentDate,
    DateTime? appointmentTime,
    String? paymentMethod,
  }) {
    final body = <String, dynamic>{
      if (appointmentDate != null)
        'appointment_date':
        appointmentDate.toIso8601String().split('T').first,
      if (appointmentTime != null)
        'appointment_time':
        '${appointmentTime.hour.toString().padLeft(2, '0')}:${appointmentTime.minute.toString().padLeft(2, '0')}',
      if (paymentMethod != null) 'payment_method': paymentMethod,
    };

    return api.patch<Appointment>(
      endpoint: ApiEndpoints.editAppointment(appointmentId),
      headers: {
        ...ApiHeaders.authed(accessToken),
        'Prefer': 'return=representation',
      },
      body: body,
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return Appointment.fromJson(json.first as Map<String, dynamic>);
        }

        if (json is Map<String, dynamic>) {
          return Appointment.fromJson(json);
        }

        if (json == null || (json is List && json.isEmpty)) {
          return Appointment(
            id: appointmentId,
            doctorId: '',
            appointmentDate: appointmentDate ?? DateTime.now(),
            appointmentTime: appointmentTime != null
                ? TimeOfDay.fromDateTime(appointmentTime)
                : TimeOfDay.fromDateTime(DateTime.now()),
            paymentMethod: paymentMethod ?? '',
            appointmentType: '',
          );
        }

        throw Exception('Unexpected response for editAppointment');
      },
    );
  }

  /// جلب كل المواعيد
  Future<ApiResult<List<Appointment>>> getAppointments({
    required String accessToken,
  }) {
    return api.get<List<Appointment>>(
      endpoint: ApiEndpoints.appointments,
      headers: ApiHeaders.authed(accessToken),
      parser: (json) {
        if (json is List) {
          return json
              .whereType<Map<String, dynamic>>()
              .map(Appointment.fromJson)
              .toList();
        }
        return <Appointment>[];
      },
    );
  }
}
