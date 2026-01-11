import 'package:appointment_app/core/classes/repositories/appointment_repository.dart';
import 'package:appointment_app/models/appoitments_details.dart';
import 'package:get/get.dart';

import '../../../core/classes/api/api.dart';
import '../../../core/classes/api/api_result.dart';
import '../../../core/services/shared_prefrences.dart';
import '../../../core/constant/app_keys.dart';

class MyAppointmentsController extends GetxController {
  final appointments = <AppointmentDetailsModel>[].obs;
  final isLoading = false.obs;
  final selectedStatus = AppointmentStatus.upcoming.obs;

  late AppointmentRepository _repo;
  late AppPreferencesService _prefs;

  String? _accessToken;

  @override
  void onInit() {
    super.onInit();

    final api = Get.find<ApiClient>();
    _prefs = Get.find<AppPreferencesService>();
    _repo = AppointmentRepository(api: api);

    _tryLoadAppointments();
  }

  void _tryLoadAppointments() async {
    everAll([], (_) {}); 

    while (true) {
      final token = _prefs.getString(PrefKeys.accessToken);

      if (token != null && token.isNotEmpty) {
        _accessToken = token;
        fetchAppointmentsByStatus(AppointmentStatus.upcoming);
        break;
      }

      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  Future<void> fetchAppointments() async {
    isLoading.value = true;

    final res = await _repo.getAppointments(
      accessToken: _accessToken!,
    );

    if (res is ApiSuccess<List<AppointmentDetailsModel>>) {
      appointments.assignAll(res.data);
    } else if (res is ApiFailure<List<AppointmentDetailsModel>>) {
      Get.snackbar('Error', res.error.message);
    }

    isLoading.value = false;
  }

  Future<void> cancelAppointment(AppointmentDetailsModel appt) async {
    final res = await _repo.cancelAppointment(
      accessToken: _accessToken!,
      appointmentId: appt.id,
    );

    if (res is ApiSuccess<void>) {
      final index = appointments.indexWhere((a) => a.id == appt.id);
      if (index != -1) {
        appointments[index] =
            appointments[index].copyWith(status: AppointmentStatus.cancelled);
      }
    } else if (res is ApiFailure<void>) {
      Get.snackbar('Error', res.error.message);
    }
  }

  Future<void> fetchAppointmentsByStatus(AppointmentStatus status) async {
    isLoading.value = true;
    selectedStatus.value = status;

    String statusString;

    if (status == AppointmentStatus.upcoming) {
      statusString = 'upcoming';
    } else if (status == AppointmentStatus.completed) {
      statusString = 'completed';
    } else {
      statusString = 'canceled'; 
    }

    final res = await _repo.getAppointmentsByStatus(
      accessToken: _accessToken!,
      status: statusString,
    );

    if (res is ApiSuccess<List<AppointmentDetailsModel>>) {
      appointments.assignAll(res.data);
    } else if (res is ApiFailure<List<AppointmentDetailsModel>>) {
      Get.snackbar('Error', res.error.message);
    }

    isLoading.value = false;
  }
}
