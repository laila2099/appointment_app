import 'package:appointment_app/core/classes/api/api.dart';
import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:get/get.dart';
import '../../../models/doctor_model.dart';
import '../model/inbox_model.dart';

class InboxController extends GetxController {
  final DoctorRepository doctorRepo = Get.find<DoctorRepository>();

  RxList<InboxModel> inboxList = <InboxModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchInboxDoctors();
  }

  Future<void> fetchInboxDoctors({String? categoryId}) async {
    try {
      isLoading.value = true;
      final ApiResult<List<Doctor>> result;

      if (categoryId != null && categoryId.isNotEmpty) {
        result =
            await doctorRepo.filterDoctorsByCategory(categoryId: categoryId);
      } else {
        result = await doctorRepo.getAllDoctors();
      }

      if (result.isSuccess) {
        final doctors = result.data ?? [];
        inboxList.value = doctors.map((doctor) {
          return InboxModel(
            name: doctor.name,
            message: doctor.specialty,
            unreadCount: 0,
            time: '',
            image: doctor.avatarUrl ?? '',
          );
        }).toList();
      } else {
        Get.snackbar("Error", result.errorMessage ?? "Failed to load messages");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
