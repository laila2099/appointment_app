import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController {
  final DoctorRepository doctorRepo = Get.find<DoctorRepository>();

  final doctorsList = <Doctor>[].obs;
  final isLoading = false.obs;
  String lastQuery = "";

  @override
  void onInit() {
    super.onInit();
    lastQuery = Get.arguments ?? "";
    fetchDoctors(query: lastQuery);
  }

  Future<void> fetchDoctors({String? query, String? categoryId}) async {
    try {
      isLoading.value = true;

      if (query != null) lastQuery = query;

      final ApiResult<List<Doctor>> result;

      if (categoryId != null && categoryId.isNotEmpty) {
        result =
            await doctorRepo.filterDoctorsByCategory(categoryId: categoryId);
      } else if (query != null && query.isNotEmpty) {
        result = await doctorRepo.searchDoctors(query: query);
      } else if (categoryId == null) {
        result = await doctorRepo.getAllDoctors();
      } else
        result = await doctorRepo.getAllDoctors();

      if (result.isSuccess) {
        doctorsList.assignAll(result.data ?? []);
      } else {
        Get.snackbar(
          "تنبيه",
          result.errorMessage ?? "حدث خطأ أثناء جلب البيانات",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Unexpected Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
