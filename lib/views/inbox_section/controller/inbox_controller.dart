import 'package:appointment_app/core/classes/api/api.dart';
import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:get/get.dart';
import '../../../models/doctor_model.dart';
import '../model/inbox_model.dart';

class InboxController extends GetxController {
  final DoctorRepository doctorRepo = DoctorRepository(
      api: ApiClient(baseUrl: 'https://hlpmplopjolzmntqrjky.supabase.co'));

  RxList<InboxModel> inboxList = <InboxModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadInbox();
  }

  void loadInbox() async {
    isLoading.value = true;

    final ApiResult<List<Doctor>> result = await doctorRepo.getAllDoctors();

    if (result is ApiSuccess<List<Doctor>>) {
      final doctors = result.data;
      inboxList.value = doctors.map((doctor) {
        return InboxModel(
          name: doctor.name,
          message: doctor.specialty,
          unreadCount: 0,
          time: '',
          image: '',
        );
      }).toList();
    } else if (result is ApiFailure) {
      print('Failed to load doctors: ${result.errorMessage}');
      inboxList.clear();
    }

    isLoading.value = false;
  }
}
