import 'dart:convert';

import 'package:appointment_app/core/classes/api/api_headers.dart';
import '../../../models/auth/auth_models.dart';
import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_result.dart';

class AuthRepository {
  final ApiClient api;

  AuthRepository({required this.api});

  Future<ApiResult<AuthSession>> signUp({
    required String email,
    required String password,
    required String phone,
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

  Future<ApiResult<AuthSession>> login({
    required String email,
    required String password,
  }) {
    return api.post<AuthSession>(
      endpoint: ApiEndpoints.loginPassword(),
      headers: ApiHeaders.public(),
      body: {
        'email': email,
        'password': password,
      },
      parser: (json) => AuthSession.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiResult<void>> resetPassword({
    required String email,
    required String newPassword,
  }) {
    return api.post<void>(
      endpoint: ApiEndpoints.resetPassword,
      body: {
        'email': email,
        'new_password': newPassword,
      },
      parser: (_) => null,
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
