import 'package:get/get.dart';

import '../../../../core/classes/api/api_result.dart';
import '../../../../core/classes/repositories/doctor_repository.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/auth_gate_service.dart';
import '../../../../core/services/shared_prefrences.dart';
import '../../../../models/doctor_model.dart';

class DoctorController extends GetxController {
  final DoctorRepository repository;

  DoctorController({required this.repository});

  final isLoading = false.obs;
  final errorMessage = Rxn<String>();
  final doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> loadDoctors() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      // Get access token if available (optional for public access)
      String? accessToken;
      try {
        final prefs = Get.find<AppPreferencesService>();
        accessToken = prefs.getString(PrefKeys.accessToken);
      } catch (_) {
        // Prefs service not available, continue without auth
      }

      final ApiResult<List<Doctor>> result = await repository.getAllDoctors(
        accessToken: accessToken,
      );

      if (result is ApiSuccess<List<Doctor>>) {
        doctors.assignAll(result.data);
        if (result.data.isEmpty) {
          errorMessage.value = 'No doctors found in the database';
        } else {
          errorMessage.value = null; 
        }
      } else if (result is ApiFailure<List<Doctor>>) {
        // Handle unauthorized/JWT expired errors
        if (result.error.type == ApiErrorType.unauthorized ||
            result.error.message.contains('session has expired') ||
            result.error.message.contains('JWT expired')) {
          // For public endpoints, retry without auth token if unauthorized
          if (accessToken != null) {
            // Retry without auth token
            final retryResult = await repository.getAllDoctors(
              accessToken: null,
            );
            if (retryResult is ApiSuccess<List<Doctor>>) {
              doctors.assignAll(retryResult.data);
              if (doctors.isEmpty) {
                errorMessage.value = 'No doctors found';
              }
              return;
            }
          }
          
          // If retry failed or no token was used, handle unauthorized
          try {
            final authGate = Get.find<AuthGateService>();
            await authGate.handleUnauthorized();
            return; 
          } catch (_) {
           
          }
        }

        errorMessage.value = result.error.message;
        Get.snackbar(
          'Error',
          result.error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
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

  /// Load only recommended doctors (is_recommended = true)
  Future<void> loadRecommendedDoctors() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      // Get access token if available (optional for public access)
      String? accessToken;
      try {
        final prefs = Get.find<AppPreferencesService>();
        accessToken = prefs.getString(PrefKeys.accessToken);
      } catch (_) {
      
      }

      final ApiResult<List<Doctor>> result = await repository.getRecommendedDoctors(
        accessToken: accessToken,
      );

      if (result is ApiSuccess<List<Doctor>>) {
        doctors.assignAll(result.data);
        if (result.data.isEmpty) {
          errorMessage.value = 'No recommended doctors found';
        } else {
          errorMessage.value = null; // Clear any previous errors
        }
      } else if (result is ApiFailure<List<Doctor>>) {
        // Handle unauthorized/JWT expired errors
        if (result.error.type == ApiErrorType.unauthorized ||
            result.error.message.contains('session has expired') ||
            result.error.message.contains('JWT expired')) {
          // For public endpoints, retry without auth token if unauthorized
          if (accessToken != null) {
            // Retry without auth token
            final retryResult = await repository.getRecommendedDoctors(
              accessToken: null,
            );
            if (retryResult is ApiSuccess<List<Doctor>>) {
              doctors.assignAll(retryResult.data);
              if (doctors.isEmpty) {
                errorMessage.value = 'No recommended doctors found';
              }
              return;
            }
          }
          
          // If retry failed or no token was used, handle unauthorized
          try {
            final authGate = Get.find<AuthGateService>();
            await authGate.handleUnauthorized();
            return; // Don't show error message, user is being redirected
          } catch (_) {
            // AuthGateService not found, continue with error handling
          }
        }

        errorMessage.value = result.error.message;
        Get.snackbar(
          'Error',
          result.error.message,
          snackPosition: SnackPosition.BOTTOM,
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

  Future<void> refresh() async {
    await loadDoctors();
  }

  // Helper method to get image path (local asset fallback or network URL)
  String getImagePath(Doctor doctor) {
    // Check if avatarUrl exists and is valid
    if (doctor.avatarUrl != null) {
      final urlStr = doctor.avatarUrl!.trim();
      
      // Check if it's not empty or "null" string
      if (urlStr.isNotEmpty && 
          urlStr.toLowerCase() != 'null' &&
          urlStr.toLowerCase() != 'undefined' &&
          urlStr != '' &&
          urlStr != 'null') {
        
        // If it's already a full URL (http/https), return it as-is
        if (urlStr.startsWith('http://') || urlStr.startsWith('https://')) {
          return urlStr;
        }
        
        // If it starts with assets/, treat as asset path
        if (urlStr.startsWith('assets/')) {
          return urlStr;
        }
        
        // If it's a relative path starting with /storage/, construct full Supabase storage URL
        if (urlStr.startsWith('/storage/')) {
          // Construct full Supabase storage URL
          // Format: https://{project_ref}.supabase.co/storage/v1/object/public/{bucket}/{path}
          return '${AppConfig.baseUrl}$urlStr';
        }
        
        // If it starts with /, it might be a relative path - prepend base URL
        if (urlStr.startsWith('/')) {
          return '${AppConfig.baseUrl}$urlStr';
        }

        // If it looks like a filename or path without leading slash, might need base URL
        // But for now, if it doesn't match any pattern, use placeholder
      }
    }
   
    final doctorImages = [
      AppImages.doctor1,
      AppImages.doctor2,
      AppImages.doctor3,
      AppImages.doctor4,
      AppImages.doctor5,
    ];
    
    if (doctor.id.isEmpty) {
      return AppImages.doctor;
    }

    final hashValue = (doctor.id.hashCode.abs() + 
                      (doctor.name.hashCode.abs())).abs();
    final imageIndex = hashValue % doctorImages.length;
    
    return doctorImages[imageIndex];
  }
}
