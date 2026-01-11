import '../../../models/appointment_model.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
import '../api/api_result.dart';

class AppointmentRepository {
  final ApiClient apiClient;

  AppointmentRepository(this.apiClient);

  /// إنشاء موعد جديد
  Future<ApiResult<Appointment>> createAppointment(Appointment appointment) async {
    return apiClient.post<Appointment>(
      endpoint: ApiEndpoints.createAppointment(),
      body: appointment.toJson(),
      headers: ApiHeaders.public(),
      parser: (json) {
        if (json is Map<String, dynamic>) {
          return Appointment.fromJson(json);
        }
        throw Exception('Unexpected response for createAppointment');
      },
    );
  }

  /// تعديل موعد موجود
  Future<ApiResult<Appointment>> editAppointment(Appointment appointment) async {
    return apiClient.patch<Appointment>(
      endpoint: ApiEndpoints.editAppointment(appointment.id!),
      body: appointment.toJson(),
      headers: {
        ...ApiHeaders.public(),
        'Prefer': 'return=representation',
      },
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return Appointment.fromJson(json.first as Map<String, dynamic>);
        } else if (json is Map<String, dynamic>) {
          return Appointment.fromJson(json);
        }
        throw Exception('Unexpected response for editAppointment');
      },
    );
  }

  /// جلب كل المواعيد
  Future<ApiResult<List<Appointment>>> getAppointments() async {
    return apiClient.get<List<Appointment>>(
      endpoint: ApiEndpoints.appointments,
      headers: ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .whereType<Map<String, dynamic>>()
              .map(Appointment.fromJson)
              .toList();
        }
        throw Exception('Unexpected response for getAppointments');
      },
    );
  }
}