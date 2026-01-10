import 'package:appointment_app/core/classes/api/api.dart';
import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/filter_doctor_repository.dart';
import 'package:appointment_app/core/config/app_config.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/models/sort_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SortController extends GetxController {
  late final FilterDoctorRepository _repository;

   var specialityList = <SortModel>[].obs;
  var ratingList = <SortModel>[].obs;
  
  var specialityIndex = 0.obs;
  var ratingIndex = 0.obs;

  var isLoading = true.obs;
  var errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
     _repository = FilterDoctorRepository(
        api: Get.put(ApiClient(baseUrl: AppConfig.baseUrl)));
    
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
      
      final result = await _repository.filterDoctors();

      if (result is ApiSuccess<List<SortModel>>) {
         specialityList.assignAll([
          SortModel(title: "All"),
          ...result.data,
        ]);
      } else if (result is ApiFailure<List<SortModel>>) {
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
}