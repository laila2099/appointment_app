sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final ApiError error;
  const ApiFailure(this.error);
}

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
