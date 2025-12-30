sealed class CrudResult<T> {
  const CrudResult();
}

class CrudSuccess<T> extends CrudResult<T> {
  final T data;
  const CrudSuccess(this.data);
}

class CrudFailure<T> extends CrudResult<T> {
  final CrudError error;
  const CrudFailure(this.error);
}

enum CrudErrorType { network, notFound, permissionDenied, unknown }

class CrudError {
  final CrudErrorType type;
  final String message;

  const CrudError({required this.type, required this.message});
}
