// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../core/classes/api/api_result.dart';
// import '../../../../core/classes/repositories/doctor_repository.dart';
// import '../../../../core/config/app_config.dart';
// import '../../../../core/constant/app_images.dart';
// import '../../../../core/constant/app_keys.dart';
// import '../../../../core/services/auth_gate_service.dart';
// import '../../../../core/services/shared_prefrences.dart';
// import '../../../../models/doctor_model.dart';
// import '../../../../routes/app_routes.dart';
// import '../../recommendation_doctor/widgets/custom_bottom_sheet.dart';

// enum CategoryPickerSource { bottomSheet, specialtiesScreen }

// class DoctorController extends GetxController {
//   final DoctorRepository repository;

//   DoctorController({required this.repository});

//   final isLoading = false.obs;
//   final errorMessage = Rxn<String>();
//   final doctors = <Doctor>[].obs;
//   final searchController = TextEditingController();
//   RxString searchQuery = ''.obs;
//   RxList<Doctor> allDoctors = <Doctor>[].obs;

//   void filterDoctors({required String? categoryId}) async {
//     if (categoryId == null) {
//       loadDoctors();
//     } else {
//       final res = await repository.filterDoctors(
//         categoryId: categoryId,
//       );

//       if (res is ApiSuccess<List<Doctor>>) {
//         debugPrint('Doctors count: ${res.data.length}');
//         doctors.clear();
//         doctors.assignAll(res.data);
//         for (final d in res.data) {
//           debugPrint(d.name);
//         }
//       } else if (res is ApiFailure<List<Doctor>>) {
//         debugPrint('Error: ${res.error.message}');
//       }
//     }
//   }

//   Future<void> loadDoctors() async {
//     isLoading.value = true;
//     errorMessage.value = null;

//     try {
//       // Get access token if available (optional for public access)
//       String? accessToken;
//       try {
//         final prefs = Get.find<AppPreferencesService>();
//         accessToken = prefs.getString(PrefKeys.accessToken);
//       } catch (_) {
//         // Prefs service not available, continue without auth
//       }

//       final ApiResult<List<Doctor>> result = await repository.getAllDoctors(
//         accessToken: accessToken,
//       );

//       if (result is ApiSuccess<List<Doctor>>) {
//         doctors.clear();
//         doctors.assignAll(result.data);
//         if (result.data.isEmpty) {
//           errorMessage.value = 'No doctors found in the database';
//         } else {
//           errorMessage.value = null;
//         }
//       } else if (result is ApiFailure<List<Doctor>>) {
//         // Handle unauthorized/JWT expired errors
//         if (result.error.type == ApiErrorType.unauthorized ||
//             result.error.message.contains('session has expired') ||
//             result.error.message.contains('JWT expired')) {
//           // For public endpoints, retry without auth token if unauthorized
//           if (accessToken != null) {
//             // Retry without auth token
//             final retryResult = await repository.getAllDoctors(
//               accessToken: null,
//             );
//             if (retryResult is ApiSuccess<List<Doctor>>) {
//               doctors.clear();
//               doctors.assignAll(retryResult.data);
//               if (doctors.isEmpty) {
//                 errorMessage.value = 'No doctors found';
//               }
//               return;
//             }
//           }

//           // If retry failed or no token was used, handle unauthorized
//           try {
//             final authGate = Get.find<AuthGateService>();
//             await authGate.handleUnauthorized();
//             return;
//           } catch (_) {}
//         }

//         errorMessage.value = result.error.message;
//         Get.snackbar(
//           'Error',
//           result.error.message,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//       Get.snackbar(
//         'Error',
//         'Failed to load doctors: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Load only recommended doctors (is_recommended = true)
//   Future<void> loadRecommendedDoctors() async {
//     isLoading.value = true;
//     errorMessage.value = null;

//     try {
//       // Get access token if available (optional for public access)
//       String? accessToken;
//       try {
//         final prefs = Get.find<AppPreferencesService>();
//         accessToken = prefs.getString(PrefKeys.accessToken);
//       } catch (_) {}

//       final ApiResult<List<Doctor>> result =
//           await repository.getRecommendedDoctors(
//         accessToken: accessToken,
//       );

//       if (result is ApiSuccess<List<Doctor>>) {
//         doctors.clear();
//         doctors.assignAll(result.data);
//         if (result.data.isEmpty) {
//           errorMessage.value = 'No recommended doctors found';
//         } else {
//           errorMessage.value = null; // Clear any previous errors
//         }
//       } else if (result is ApiFailure<List<Doctor>>) {
//         // Handle unauthorized/JWT expired errors
//         if (result.error.type == ApiErrorType.unauthorized ||
//             result.error.message.contains('session has expired') ||
//             result.error.message.contains('JWT expired')) {
//           // For public endpoints, retry without auth token if unauthorized
//           if (accessToken != null) {
//             // Retry without auth token
//             final retryResult = await repository.getRecommendedDoctors(
//               accessToken: null,
//             );
//             if (retryResult is ApiSuccess<List<Doctor>>) {
//               doctors.clear();
//               doctors.assignAll(retryResult.data);
//               if (doctors.isEmpty) {
//                 errorMessage.value = 'No recommended doctors found';
//               }
//               return;
//             }
//           }

//           // If retry failed or no token was used, handle unauthorized
//           try {
//             final authGate = Get.find<AuthGateService>();
//             await authGate.handleUnauthorized();
//             return; // Don't show error message, user is being redirected
//           } catch (_) {
//             // AuthGateService not found, continue with error handling
//           }
//         }

//         errorMessage.value = result.error.message;
//         Get.snackbar(
//           'Error',
//           result.error.message,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//       Get.snackbar(
//         'Error',
//         'Failed to load recommended doctors: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   @override
//   Future<void> refresh() async {
//     await loadRecommendedDoctors();
//   }

//   // Helper method to get image path (local asset fallback or network URL)
//   String getImagePath(Doctor doctor) {
//     // Check if avatarUrl exists and is valid
//     if (doctor.avatarUrl != null) {
//       final urlStr = doctor.avatarUrl!.trim();

//       // Check if it's not empty or "null" string
//       if (urlStr.isNotEmpty &&
//           urlStr.toLowerCase() != 'null' &&
//           urlStr.toLowerCase() != 'undefined' &&
//           urlStr != '' &&
//           urlStr != 'null') {
//         // If it's already a full URL (http/https), return it as-is
//         if (urlStr.startsWith('http://') || urlStr.startsWith('https://')) {
//           return urlStr;
//         }

//         // If it starts with assets/, treat as asset path
//         if (urlStr.startsWith('assets/')) {
//           return urlStr;
//         }

//         // If it's a relative path starting with /storage/, construct full Supabase storage URL
//         if (urlStr.startsWith('/storage/')) {
//           // Construct full Supabase storage URL
//           // Format: https://{project_ref}.supabase.co/storage/v1/object/public/{bucket}/{path}
//           return '${AppConfig.baseUrl}$urlStr';
//         }

//         // If it starts with /, it might be a relative path - prepend base URL
//         if (urlStr.startsWith('/')) {
//           return '${AppConfig.baseUrl}$urlStr';
//         }

//         // If it looks like a filename or path without leading slash, might need base URL
//         // But for now, if it doesn't match any pattern, use placeholder
//       }
//     }

//     final doctorImages = [
//       AppImages.doctor1,
//       AppImages.doctor2,
//       AppImages.doctor3,
//       AppImages.doctor4,
//       AppImages.doctor5,
//     ];

//     if (doctor.id.isEmpty) {
//       return AppImages.doctor;
//     }

//     final hashValue =
//         (doctor.id.hashCode.abs() + (doctor.name.hashCode.abs())).abs();
//     final imageIndex = hashValue % doctorImages.length;

//     return doctorImages[imageIndex];
//   }

//   Future<void> sortDoctorsBySpeciality({
//     CategoryPickerSource source = CategoryPickerSource.bottomSheet,
//   }) async {
//     String? categoryId;

//     switch (source) {
//       case CategoryPickerSource.bottomSheet:
//         final result = await Get.bottomSheet(
//           CustomBottomSheet(),
//           isScrollControlled: true,
//         );
//         categoryId = result as String?;

//         break;

//       case CategoryPickerSource.specialtiesScreen:
//         final result = await Get.toNamed(
//           AppRoutes.doctorSpecialtiesScreen,
//         );
//         categoryId = result as String?;
//         break;
//     }

//     if (categoryId == null) return;

//     filterDoctors(categoryId: categoryId);
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/classes/api/api_result.dart';
import '../../../../core/classes/repositories/doctor_repository.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/auth_gate_service.dart';
import '../../../../core/services/shared_prefrences.dart';
import '../../../../models/doctor_model.dart';
import '../../../../routes/app_routes.dart';
import '../../recommendation_doctor/widgets/custom_bottom_sheet.dart';

enum CategoryPickerSource { bottomSheet, specialtiesScreen }

class DoctorController extends GetxController {
  final DoctorRepository repository;

  DoctorController({required this.repository});

  /// Loading state
  final isLoading = false.obs;
  final errorMessage = Rxn<String>();

  /// Displayed doctors (filtered or recommended)
  final doctors = <Doctor>[].obs;

  /// All doctors (unfiltered)
  final allDoctors = <Doctor>[].obs;

  /// Search
  final searchController = TextEditingController();
  RxString searchQuery = ''.obs;

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// --------------------- Load All Doctors ---------------------
  Future<void> loadDoctors() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      String? accessToken;
      try {
        final prefs = Get.find<AppPreferencesService>();
        accessToken = prefs.getString(PrefKeys.accessToken);
      } catch (_) {}

      final ApiResult<List<Doctor>> result = await repository.getAllDoctors(
        accessToken: accessToken,
      );

      if (result is ApiSuccess<List<Doctor>>) {
        doctors.assignAll(result.data);
        allDoctors.assignAll(result.data); // حفظ نسخة للبحث

        if (result.data.isEmpty) {
          errorMessage.value = 'No doctors found in the database';
        } else {
          errorMessage.value = null;
        }
      } else if (result is ApiFailure<List<Doctor>>) {
        await _handleApiFailure(result, accessToken,
            retryFunction: loadDoctors);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to load doctors: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// --------------------- Load Recommended Doctors ---------------------
  Future<void> loadRecommendedDoctors() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      String? accessToken;
      try {
        final prefs = Get.find<AppPreferencesService>();
        accessToken = prefs.getString(PrefKeys.accessToken);
      } catch (_) {}

      final ApiResult<List<Doctor>> result =
          await repository.getRecommendedDoctors(
        accessToken: accessToken,
      );

      if (result is ApiSuccess<List<Doctor>>) {
        doctors.assignAll(result.data);
        allDoctors.assignAll(result.data); // نسخة أصلية للبحث

        if (result.data.isEmpty) {
          errorMessage.value = 'No recommended doctors found';
        } else {
          errorMessage.value = null;
        }
      } else if (result is ApiFailure<List<Doctor>>) {
        await _handleApiFailure(
          result,
          accessToken,
          retryFunction: loadRecommendedDoctors,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to load recommended doctors: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// --------------------- Search Doctors ---------------------
  void searchDoctors(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      doctors.assignAll(allDoctors);
      return;
    }

    doctors.assignAll(
      allDoctors.where((d) =>
          d.name.toLowerCase().contains(query.toLowerCase()) ||
          d.specialty.toLowerCase().contains(query.toLowerCase())),
    );
  }

  /// --------------------- Filter by Category ---------------------
  void filterDoctors({required String? categoryId}) async {
    isLoading.value = true;
    if (categoryId == null) {
      loadDoctors();
      isLoading.value = false;
      return;
    }

    final res = await repository.filterDoctors(categoryId: categoryId);

    if (res is ApiSuccess<List<Doctor>>) {
      doctors.assignAll(res.data);
      allDoctors.assignAll(res.data);
    } else if (res is ApiFailure<List<Doctor>>) {
      Get.snackbar(
        'Error',
        res.error.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  /// --------------------- Sort / Category Picker ---------------------
  Future<void> sortDoctorsBySpeciality({
    CategoryPickerSource source = CategoryPickerSource.bottomSheet,
  }) async {
    String? categoryId;

    switch (source) {
      case CategoryPickerSource.bottomSheet:
        final result = await Get.bottomSheet(
          CustomBottomSheet(),
          isScrollControlled: true,
        );
        categoryId = result as String?;
        break;

      case CategoryPickerSource.specialtiesScreen:
        final result = await Get.toNamed(AppRoutes.doctorSpecialtiesScreen);
        categoryId = result is String ? result : null;

        break;
    }

    if (categoryId != null) filterDoctors(categoryId: categoryId);
  }

  /// --------------------- Refresh ---------------------
  @override
  Future<void> refresh() async {
    await loadRecommendedDoctors();
  }

  /// --------------------- Get Image Path ---------------------
  String getImagePath(Doctor doctor) {
    if (doctor.avatarUrl != null) {
      final urlStr = doctor.avatarUrl!.trim();
      if (urlStr.isNotEmpty &&
          urlStr.toLowerCase() != 'null' &&
          urlStr.toLowerCase() != 'undefined') {
        if (urlStr.startsWith('http://') || urlStr.startsWith('https://')) {
          return urlStr;
        }
        if (urlStr.startsWith('assets/')) return urlStr;
        if (urlStr.startsWith('/storage/') || urlStr.startsWith('/')) {
          return '${AppConfig.baseUrl}$urlStr';
        }
      }
    }

    final doctorImages = [
      AppImages.doctor1,
      AppImages.doctor2,
      AppImages.doctor3,
      AppImages.doctor4,
      AppImages.doctor5,
    ];

    if (doctor.id.isEmpty) return AppImages.doctor;

    final hashValue =
        (doctor.id.hashCode.abs() + doctor.name.hashCode.abs()).abs();
    final imageIndex = hashValue % doctorImages.length;

    return doctorImages[imageIndex];
  }

  /// --------------------- Private helper for API failure ---------------------
  Future<void> _handleApiFailure(
    ApiFailure<List<Doctor>> result,
    String? accessToken, {
    required Future<void> Function() retryFunction,
  }) async {
    if (result.error.type == ApiErrorType.unauthorized ||
        result.error.message.contains('session has expired') ||
        result.error.message.contains('JWT expired')) {
      // Retry without token if exists
      if (accessToken != null) {
        final retryResult = await retryFunction();
        return;
      }

      try {
        final authGate = Get.find<AuthGateService>();
        await authGate.handleUnauthorized();
        return;
      } catch (_) {}
    }

    errorMessage.value = result.error.message;
    Get.snackbar(
      'Error',
      result.error.message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
