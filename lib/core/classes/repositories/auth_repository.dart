import 'dart:convert';

import '../../../models/auth/auth_models.dart';
import '../../network/api_endpoints.dart';
import '../api/api.dart';
import '../api/api_result.dart';

class AuthRepository {
  final ApiClient api;

  AuthRepository({required this.api});

  Future<ApiResult<AuthSession>> signUp({
    required String email,
    required String password,
  }) {
    return api.post<AuthSession>(
      endpoint: ApiEndpoints.signUpWithKey(),
      body: {
        'email': email,
        'password': password,
      },
      parser: (json) => AuthSession.fromJson(json as Map<String, dynamic>),
    );
  }

  String? extractErrorCode(String raw) {
    try {
      final j = jsonDecode(raw);
      return j['error_code']?.toString();
    } catch (_) {
      return null;
    }
  }

  String extractMessage(String raw) {
    try {
      final j = jsonDecode(raw);
      return j['msg']?.toString() ?? raw;
    } catch (_) {
      return raw;
    }
  }
}
