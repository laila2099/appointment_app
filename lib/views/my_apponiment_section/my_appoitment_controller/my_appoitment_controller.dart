import 'package:appoitment_app/models/appoitments_details.dart';
import 'package:get/get.dart';

class MyAppointmentsController extends GetxController {
  final appointments = <AppointmentDetailsModel>[].obs;
  final isLoading = true.obs;

  RxList<AppointmentDetailsModel> get upcomingAppointments => appointments
      .where((a) => a.status == AppointmentStatus.upcoming)
      .toList()
      .obs;

  RxList<AppointmentDetailsModel> get completedAppointments => appointments
      .where((a) => a.status == AppointmentStatus.completed)
      .toList()
      .obs;

  RxList<AppointmentDetailsModel> get cancelledAppointments => appointments
      .where((a) => a.status == AppointmentStatus.cancelled)
      .toList()
      .obs;

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  void cancelAppointment(AppointmentDetailsModel appt) {
    // تحديث الحالة
    final index = appointments.indexWhere((a) => a.id == appt.id);
    if (index != -1) {
      appointments[index] = appointments[index].copyWith(
        status: AppointmentStatus.cancelled,
      );
    }
  }

  Future<void> fetchAppointments() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    appointments.assignAll(_dummy());

    isLoading.value = false;
  }

  List<AppointmentDetailsModel> _dummy() => [
    AppointmentDetailsModel(
      id: '1',
      doctorId: '1',
      doctorName: 'll Randy Wigham',
      specialty: 'General',
      clinic: 'RSUD Gatot Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      status: AppointmentStatus.upcoming,
    ),
    AppointmentDetailsModel(
      id: '2',
      doctorId: '2',
      doctorName: 'Dr Randy Wigham',
      specialty: 'General',
      clinic: 'RSUD Gatot Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      status: AppointmentStatus.upcoming,
    ),
    AppointmentDetailsModel(
      id: '3',
      doctorId: '3',
      doctorName: 'lo Randy Wigham',
      specialty: 'General',
      clinic: 'RSUD Gatot Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      status: AppointmentStatus.upcoming,
    ),
    AppointmentDetailsModel(
      id: '4',
      doctorId: '4',
      doctorName: 'Dr Alice Smith',
      specialty: 'Dermatology',
      clinic: 'Gatot Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      status: AppointmentStatus.completed,
    ),
    AppointmentDetailsModel(
      id: '5',
      doctorId: '5',
      doctorName: 'Dr Alice Smith',
      specialty: 'Dermatology',
      clinic: 'Gatot Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      status: AppointmentStatus.completed,
    ),
    AppointmentDetailsModel(
      id: '6',
      doctorId: '6',
      doctorName: 'Dr John Doe',
      specialty: 'Cardiology',
      clinic: 'RSUD Subroto',
      appointmentDateTime: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      status: AppointmentStatus.cancelled,
    ),
  ];
}
