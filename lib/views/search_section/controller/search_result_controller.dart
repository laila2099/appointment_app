import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/doctor_repository.dart';
import 'package:appointment_app/models/doctor_model.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/controllers/sort_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultController extends GetxController {
  final DoctorRepository doctorRepo = Get.find<DoctorRepository>();
  final sortController = Get.find<SortController>();

  final doctorsList = <Doctor>[].obs;
  final isLoading = false.obs;
  String? lastQuery = "";
  String? categoryId = "";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      lastQuery = Get.arguments['query'] ?? "";
      categoryId = Get.arguments['categoryId'] ?? "";
    } else if (Get.arguments is String) {
      lastQuery = Get.arguments;
      categoryId = "";
    }

    fetchDoctors(query: lastQuery, categoryId: categoryId);
  }

  Future<void> fetchDoctors({String? query, String? categoryId}) async {
    try {
      isLoading.value = true;
      doctorsList.clear();

      if (query != null) lastQuery = query;
      if (categoryId != null) this.categoryId = categoryId;

      String? finalCategoryId = categoryId ?? this.categoryId;
      String? finalQuery = query ?? lastQuery;

      if (finalQuery != null && finalQuery.toLowerCase().trim() == 'general') {
        finalCategoryId = "0";
        finalQuery = null;
        sortController.selectSpeciality(0);
      } else if (finalQuery != null &&
          finalQuery.trim().isNotEmpty &&
          (finalCategoryId == null ||
              finalCategoryId.isEmpty ||
              finalCategoryId == "0")) {
        final matchedCategory = sortController.specialityList.firstWhereOrNull(
            (cat) =>
                cat.title.toLowerCase().trim() ==
                    finalQuery!.toLowerCase().trim() ||
                cat.title
                    .toLowerCase()
                    .trim()
                    .contains(finalQuery!.toLowerCase().trim()));

        if (matchedCategory != null) {
          if (matchedCategory.title.toLowerCase() == 'general') {
            finalCategoryId = "0";
            finalQuery = null;
            sortController.selectSpeciality(0);
          } else {
            finalCategoryId = matchedCategory.id.toString();
            finalQuery = null;
            int index = sortController.specialityList.indexOf(matchedCategory);
            sortController.selectSpeciality(index);
          }
        }
      }

      final ApiResult<List<Doctor>> result;

      if (finalCategoryId != null &&
          finalCategoryId != "" &&
          finalCategoryId != "0") {
        result = await doctorRepo.filterDoctorsByCategory(
            categoryId: finalCategoryId);
      } else if (finalQuery != null && finalQuery.trim().isNotEmpty) {
        result = await doctorRepo.searchDoctors(query: finalQuery);
      } else {
        result = await doctorRepo.getAllDoctors();
        sortController.selectSpeciality(0);
      }

      if (result.isSuccess) {
        doctorsList.assignAll(result.data ?? []);
      } else {
        Get.snackbar("تنبيه", result.errorMessage ?? "حدث خطأ ما");
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
