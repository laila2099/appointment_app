import '../../../models/review_model.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
import '../api/api_result.dart';

class ReviewRepository {
  final ApiClient api;

  ReviewRepository({required this.api});

  /// Get reviews by doctor ID
  Future<ApiResult<List<Review>>> getReviewsByDoctorId({
    required String doctorId,
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Review>>(
      endpoint: ApiEndpoints.getReviewsByDoctorId(doctorId, select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) => Review.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }

  /// Get all reviews
  Future<ApiResult<List<Review>>> getAllReviews({
    String? accessToken,
    String select = '*',
  }) {
    return api.get<List<Review>>(
      endpoint: ApiEndpoints.getAllReviews(select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List) {
          return json
              .map((item) => Review.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }

  /// Get a single review by ID
  Future<ApiResult<Review?>> getReviewById({
    required String reviewId,
    String? accessToken,
    String select = '*',
  }) {
    return api.get<Review?>(
      endpoint: ApiEndpoints.getReviewById(reviewId, select: select),
      headers: accessToken != null
          ? ApiHeaders.authed(accessToken)
          : ApiHeaders.public(),
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return Review.fromJson(json.first as Map<String, dynamic>);
        }
        return null;
      },
    );
  }
}

