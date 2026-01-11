import '../../../models/doctor_model.dart';
import '../../../views/home_section/home_screen/model/category_model.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
import '../api/api_result.dart';

class DoctorRepository {
  final ApiClient api;

  DoctorRepository({required this.api});

  /// Get all doctors
  Future<ApiResult<List<Doctor>>> getAllDoctors({
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Doctor>>(
      endpoint: ApiEndpoints.getAllDoctors(select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json == null) {
          return <Doctor>[];
        }
        if (json is List) {
          return json
              .map((item) {
                try {
                  if (item is Map<String, dynamic>) {
                    return Doctor.fromJson(item);
                  }
                  return null;
                } catch (e) {
                  print('Error parsing doctor: $e');
                  return null;
                }
              })
              .whereType<Doctor>()
              .toList();
        }
        // If it's a single object, wrap it in a list
        if (json is Map<String, dynamic>) {
          try {
            return [Doctor.fromJson(json)];
          } catch (e) {
            print('Error parsing doctor object: $e');
            return <Doctor>[];
          }
        }
        return <Doctor>[];
      },
    );
  }

  /// Get recommended doctors only (is_recommended = true)
  Future<ApiResult<List<Doctor>>> getRecommendedDoctors({
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Doctor>>(
      endpoint: ApiEndpoints.getRecommendedDoctors(select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json == null) {
          return <Doctor>[];
        }
        if (json is List) {
          return json
              .map((item) {
                try {
                  if (item is Map<String, dynamic>) {
                    return Doctor.fromJson(item);
                  }
                  return null;
                } catch (e) {
                  // Log error but continue processing other items
                  print('Error parsing doctor: $e');
                  return null;
                }
              })
              .whereType<Doctor>()
              .toList();
        }
        // If it's a single object, wrap it in a list
        if (json is Map<String, dynamic>) {
          try {
            return [Doctor.fromJson(json)];
          } catch (e) {
            print('Error parsing doctor object: $e');
            return <Doctor>[];
          }
        }
        return <Doctor>[];
      },
    );
  }

  /// Get a single doctor by ID
  Future<ApiResult<Doctor?>> getDoctorById({
    required String doctorId,
    String? accessToken,
    String select = '*',
  }) {
    return api.get<Doctor?>(
      endpoint: ApiEndpoints.getDoctorById(doctorId, select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return Doctor.fromJson(json.first as Map<String, dynamic>);
        }
        return null;
      },
    );
  }

  /// Filter doctors by category
  Future<ApiResult<List<Doctor>>> filterDoctorsByCategory({
    required String categoryId,
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Doctor>>(
      endpoint: ApiEndpoints.filterDoctors(
        categoryId,
      ),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) => Doctor.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }

  /// Search doctors by name
  Future<ApiResult<List<Doctor>>> searchDoctors({
    required String query,
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Doctor>>(
      endpoint: ApiEndpoints.searchDoctors(query, select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) => Doctor.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }

  /// Get doctors by specialty
  // Future<ApiResult<List<Doctor>>> getDoctorsBySpecialty({
  //   required String specialty,
  //   String? accessToken,
  //   String select = '*',
  // }) {
  //   return api.get<List<Doctor>>(
  //     endpoint: ApiEndpoints.getDoctorsBySpecialty(specialty, select: select),
  //     headers: accessToken != null
  //         ? ApiHeaders.authed(accessToken)
  //         : ApiHeaders.public(),
  //     parser: (json) {
  //       if (json is List) {
  //         return json
  //             .map((item) => Doctor.fromJson(item as Map<String, dynamic>))
  //             .toList();
  //       }
  //       return [];
  //     },
  //   );
  // }

  Future<ApiResult<List<Doctor>>> filterDoctors(
      {required String categoryId, String? accessToken}) {
    return api.get<List<Doctor>>(
      endpoint: ApiEndpoints.filterDoctors(categoryId),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) => Doctor.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }

  Future<ApiResult<List<CategoryModel>>> getCategories() {
    return api.get<List<CategoryModel>>(
      endpoint: ApiEndpoints.getCategories(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) =>
                  CategoryModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }
}
