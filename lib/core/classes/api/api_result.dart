// api_result.dart
sealed class ApiResult<T> {
  const ApiResult();

  /// Getter للتحقق إذا كانت النتيجة نجاح
  bool get isSuccess => this is ApiSuccess<T>;

  /// Getter للتحقق إذا كانت النتيجة فشل
  bool get isFailure => this is ApiFailure<T>;

  /// الحصول على البيانات إذا كانت نجاح
  T? get data => this is ApiSuccess<T> ? (this as ApiSuccess<T>).data : null;

  /// الحصول على رسالة الخطأ إذا كانت فشل
  String? get errorMessage =>
      this is ApiFailure<T> ? (this as ApiFailure<T>).error.message : null;
}

/// حالة النجاح
class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

/// حالة الفشل
class ApiFailure<T> extends ApiResult<T> {
  final ApiError error;
  const ApiFailure(this.error);
}

/// معلومات الخطأ
class ApiError {
  final String message;
  final int? statusCode;
  final ApiErrorType type;

  const ApiError({
    required this.message,
    this.statusCode,
    this.type = ApiErrorType.unknown,
  });
}

enum ApiErrorType { network, unauthorized, timeout, server, unknown }
