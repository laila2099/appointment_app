import 'package:get/get.dart';

import '../../../../core/classes/api/api_result.dart';
import '../../../../core/classes/repositories/doctor_repository.dart';
import '../../../../core/classes/repositories/review_repository.dart';
import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/auth_gate_service.dart';
import '../../../../core/services/shared_prefrences.dart';
import '../../../../models/doctor_model.dart';
import '../../../../models/review_model.dart';
import '../../../../routes/app_routes.dart';

class DoctorDetailsController extends GetxController {
  final DoctorRepository doctorRepository;
  final ReviewRepository reviewRepository;

  DoctorDetailsController({
    required this.doctorRepository,
    required this.reviewRepository,
  });

  final isLoading = true.obs;
  final isLoadingReviews = false.obs;
  final errorMessage = Rxn<String>();
  final reviewsError = Rxn<String>();

  final doctor = Rxn<Doctor>();
  final reviews = <Review>[].obs;

  late String doctorId;

  @override
  void onInit() {
    super.onInit();

    // Get doctor ID from route arguments, or use default
    final args = Get.arguments;
    if (args is Map && args.containsKey('doctorId')) {
      doctorId = args['doctorId'].toString();
    } else if (args is String) {
      doctorId = args;
    } else {
      // Fallback: get from route parameters if available
      doctorId = Get.parameters['id'] ?? '1';
    }

    _loadDoctor();
    _loadReviews();
  }

  Future<void> _loadDoctor() async {
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

      final ApiResult<Doctor?> result = await doctorRepository.getDoctorById(
        doctorId: doctorId,
        accessToken: accessToken,
      );

      if (result is ApiSuccess<Doctor?>) {
        if (result.data != null) {
          doctor.value = result.data;
        } else {
          errorMessage.value = 'doctor_not_found'.tr;
          Get.snackbar(
            'snackbar_error'.tr,
            'doctor_not_found'.tr,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else if (result is ApiFailure<Doctor?>) {
        // Handle unauthorized/JWT expired errors
        if (result.error.type == ApiErrorType.unauthorized ||
            result.error.message.contains('session has expired') ||
            result.error.message.contains('JWT expired')) {
          try {
            final authGate = Get.find<AuthGateService>();
            await authGate.handleUnauthorized();
            return; // Don't show error message, user is being redirected
          } catch (_) {
            // AuthGateService not found, continue with error handling
          }
        }

        errorMessage.value = result.error.message;
        // For public endpoints, try again without auth if unauthorized
        if (result.error.type == ApiErrorType.unauthorized) {
          // Retry without auth token
          final retryResult = await doctorRepository.getDoctorById(
            doctorId: doctorId,
            accessToken: null,
          );
          if (retryResult is ApiSuccess<Doctor?>) {
            if (retryResult.data != null) {
              doctor.value = retryResult.data;
              return;
            }
          }
        }
        Get.snackbar(
          'snackbar_error'.tr,
          result.error.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'snackbar_error'.tr,
        'doctor_load_failed: ${e.toString()}'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadReviews() async {
    isLoadingReviews.value = true;
    reviewsError.value = null;

    try {
      // Get access token if available (optional for public access)
      String? accessToken;
      try {
        final prefs = Get.find<AppPreferencesService>();
        accessToken = prefs.getString(PrefKeys.accessToken);
      } catch (_) {
        // Prefs service not available, continue without auth
      }

      final ApiResult<List<Review>> result =
          await reviewRepository.getReviewsByDoctorId(
        doctorId: doctorId,
        accessToken: accessToken,
      );

      if (result is ApiSuccess<List<Review>>) {
        reviews.assignAll(result.data);

        // Calculate average rating from actual reviews
        if (reviews.isNotEmpty && doctor.value != null) {
          final totalStars = reviews.fold<double>(
            0.0,
            (sum, review) => sum + review.stars,
          );
          final averageRating = totalStars / reviews.length;

          // Update doctor with calculated average rating and review count
          doctor.value = doctor.value!.copyWith(
            ratingAvg: averageRating,
            ratingCount: reviews.length,
          );
        }
      } else if (result is ApiFailure<List<Review>>) {
        reviewsError.value = result.error.message;
        // Don't show snackbar for reviews error, just log it
        // Reviews are optional, so we don't want to show error if doctor loads successfully
      }
    } catch (e) {
      reviewsError.value = e.toString();
      // Silently handle reviews error - reviews are optional
    } finally {
      isLoadingReviews.value = false;
    }
  }

  @override
  Future<void> refresh() async {
    await Future.wait([
      _loadDoctor(),
      _loadReviews(),
    ]);
  }

  void onMakeAppointment() {
    if (doctor.value == null) {
      Get.snackbar(
        'snackbar_error'.tr,
        'doctor_info_not_available'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.find<AuthGateService>().goProtected(
      AppRoutes.bookingAppointment,
      args: {'doctor': doctor.value, 'doctorId': doctorId},
    );
  }
}
