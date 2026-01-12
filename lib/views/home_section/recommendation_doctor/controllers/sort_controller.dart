import 'package:appointment_app/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:appointment_app/views/home_section/home_screen/model/category_model.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/models/sort_model.dart';
import 'package:appointment_app/views/search_section/controller/search_result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/classes/api/api_result.dart';
import '../../../../core/classes/repositories/doctor_repository.dart';

class SortController extends GetxController {
  final DoctorRepository _repository = Get.find();

  var specialityList = <CategoryModel>[].obs;
  var ratingList = <SortModel>[].obs;

  var specialityIndex = 0.obs;
  var ratingIndex = 0.obs;

  var isLoading = true.obs;
  var errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();

    _initializeRatingList();
    fetchSpecialities();
  }

  void _initializeRatingList() {
    ratingList.assignAll([
      SortModel(title: "All", icon: Icons.star),
      SortModel(title: "5", icon: Icons.star),
      SortModel(title: "4", icon: Icons.star),
      SortModel(title: "3", icon: Icons.star),
      SortModel(title: "2", icon: Icons.star),
      SortModel(title: "1", icon: Icons.star),
    ]);
  }

  Future<void> fetchSpecialities() async {
    try {
      isLoading(true);
      errorMessage.value = null;

      final result = await _repository.getCategories();

      if (result is ApiSuccess<List<CategoryModel>>) {
        specialityList.assignAll([
          ...result.data,
        ]);
      } else if (result is ApiFailure<List<CategoryModel>>) {
        final errorMsg = result.error.message;
        errorMessage.value = errorMsg;
        Get.snackbar("Error", "Failed to load specialities: $errorMsg");
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Error", "Exception: $e");
    } finally {
      isLoading(false);
    }
  }

  void selectSpeciality(int index) {
    specialityIndex.value = index;
  }

  void selectRating(int index) {
    ratingIndex.value = index;
  }

  void retryFetch() {
    fetchSpecialities();
  }

  void done() {
    final selectedId = specialityList[specialityIndex.value].id.toString();

    if (Get.isRegistered<SearchResultController>()) {
      Get.find<SearchResultController>().fetchDoctors(categoryId: selectedId);
    } else if (Get.isRegistered<DoctorController>()) {
      Get.find<DoctorController>().filterDoctors(categoryId: selectedId);
    }

    Get.back();
  }
}
