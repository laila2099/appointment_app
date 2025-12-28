import 'dart:convert';
import 'package:app_appointment/core/classes/api/api_result.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final Duration timeout;

  ApiClient({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
  });

  // -------------------- HEADERS --------------------
  Map<String, String> _defaultHeaders(Map<String, String>? headers) {
    return {'Content-Type': 'application/json', ...?headers};
  }

  // -------------------- POST --------------------
  Future<ApiResult<T>> post<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    required T Function(dynamic json) parser,
  }) async {
    return _send<T>(
      request: () => http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: _defaultHeaders(headers),
        body: jsonEncode(body),
      ),
      parser: parser,
    );
  }

  // -------------------- GET --------------------
  Future<ApiResult<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    required T Function(dynamic json) parser,
  }) async {
    final uri = Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: query?.map((k, v) => MapEntry(k, v.toString())));

    return _send<T>(
      request: () => http.get(uri, headers: _defaultHeaders(headers)),
      parser: parser,
    );
  }

  // -------------------- PUT --------------------
  Future<ApiResult<T>> put<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    required T Function(dynamic json) parser,
  }) async {
    return _send<T>(
      request: () => http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: _defaultHeaders(headers),
        body: jsonEncode(body),
      ),
      parser: parser,
    );
  }

  // -------------------- DELETE --------------------
  Future<ApiResult<T>> delete<T>({
    required String endpoint,
    Map<String, String>? headers,
    required T Function(dynamic json) parser,
  }) async {
    return _send<T>(
      request: () => http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: _defaultHeaders(headers),
      ),
      parser: parser,
    );
  }

  // -------------------- CORE SENDER --------------------
  Future<ApiResult<T>> _send<T>({
    required Future<http.Response> Function() request,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await request().timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = response.body.isNotEmpty
            ? jsonDecode(response.body)
            : null;
        return ApiSuccess(parser(json));
      }

      return ApiFailure(
        ApiError(
          message: response.body.isNotEmpty ? response.body : 'Server error',
          statusCode: response.statusCode,
          type: _mapStatusCode(response.statusCode),
        ),
      );
    } catch (e) {
      return ApiFailure(
        ApiError(message: e.toString(), type: ApiErrorType.network),
      );
    }
  }

  ApiErrorType _mapStatusCode(int statusCode) {
    if (statusCode == 401 || statusCode == 403) {
      return ApiErrorType.unauthorized;
    }
    if (statusCode >= 500) {
      return ApiErrorType.server;
    }
    return ApiErrorType.unknown;
  }
}
