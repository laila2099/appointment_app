import '../../../models/user_profile_model.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_headers.dart';
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

  Future<ApiResult<UserProfile>> getProfile({
    required String accessToken,
    required String userId,
  }) {
    return api.get<UserProfile>(
      endpoint: ApiEndpoints.getProfile(userId),
      headers: ApiHeaders.authed(accessToken),
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return UserProfile.fromJson(json.first as Map<String, dynamic>);
        }
        throw Exception('Profile not found');
      },
    );
  }

  Future<ApiResult<UserProfile>> editProfile({
    required String accessToken,
    required String userId,
    String? fullName,
    String? phone,
    String? birthdate,
    String? email,
  }) {
    final body = <String, dynamic>{
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (birthdate != null) 'birthdate': birthdate,
      if (email != null) 'email': email,
    };

    return api.patch<UserProfile>(
      endpoint: ApiEndpoints.editProfile(userId),
      headers: {
        ...ApiHeaders.authed(accessToken),
        'Prefer': 'return=representation',
      },
      body: body,
      parser: (json) {
        if (json is List && json.isNotEmpty) {
          return UserProfile.fromJson(json.first as Map<String, dynamic>);
        }
        throw Exception('Unexpected response for editProfile');
      },
    );
  }
}
