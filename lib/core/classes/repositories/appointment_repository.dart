import '../../../models/appoitments_details.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
import '../api/api_result.dart';

class AppointmentRepository {
  final ApiClient api;

  AppointmentRepository({required this.api});

  /// Get all appointments with doctor
  Future<ApiResult<List<AppointmentDetailsModel>>> getAppointments({
    required String accessToken,
  }) {
    return api.get<List<AppointmentDetailsModel>>(
      endpoint: ApiEndpoints.appointmentsWithDoctor,
      headers: ApiHeaders.authed(accessToken),
      parser: (json) {
        if (json is List) {
          return json
              .map((e) =>
                  AppointmentDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        throw Exception('Unexpected response');
      },
    );
  }

  /// Get appointments by status (upcoming / completed / cancelled)
  Future<ApiResult<List<AppointmentDetailsModel>>> getAppointmentsByStatus({
    required String accessToken,
    required String status,
  }) {
    return api.get<List<AppointmentDetailsModel>>(
      endpoint: ApiEndpoints.filterAppointments(status),
      headers: ApiHeaders.authed(accessToken),
      parser: (json) {
        if (json is List) {
          return json
              .map((e) =>
                  AppointmentDetailsModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        throw Exception('Unexpected response');
      },
    );
  }

  /// Cancel appointment
  Future<ApiResult<void>> cancelAppointment({
    required String accessToken,
    required String appointmentId,
  }) {
    return api.patch<void>(
      endpoint: ApiEndpoints.editAppointment(appointmentId),
      headers: ApiHeaders.authed(accessToken),
      body: {
        'status': 'cancelled',
      },
      parser: (_) => null,
    );
  }
}
