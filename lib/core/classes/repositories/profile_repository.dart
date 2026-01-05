import '../../../models/user_profile_model.dart';
import '../../network/api_endpoints.dart';
import '../../network/api_headers.dart';
import '../api/api.dart';
import '../api/api_result.dart';

class ProfileRepository {
  final ApiClient api;
  ProfileRepository({required this.api});

  Future<ApiResult<UserProfile>> setProfile({
    required String accessToken,
    required String id,
    required String fullName,
    required String phone,
    String? birthdate,
  }) {
    final body = <String, dynamic>{
      'id': id,
      'full_name': fullName,
      'phone': phone,
      'birthdate': birthdate,
    };

    return api.post<UserProfile>(
      endpoint: ApiEndpoints.profiles,
      headers: {
        ...ApiHeaders.authed(accessToken),
        'Prefer': 'return=representation',
      },
      body: body,
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return UserProfile.fromJson(json.first as Map<String, dynamic>);
        }
        if (json is Map<String, dynamic>) {
          return UserProfile.fromJson(json);
        }
        throw Exception('Unexpected response for setProfile');
      },
    );
  }
}
