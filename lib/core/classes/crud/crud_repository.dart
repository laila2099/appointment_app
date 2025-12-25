import 'package:appoitment_app/core/classes/crud/crud_result.dart';
import 'package:appoitment_app/core/classes/crud/pagination.dart';

abstract class CrudRepository<T> {
  Future<CrudResult<T>> create(T entity);

  Future<CrudResult<T?>> read(String id);

  Future<CrudResult<List<T>>> readAll({Pagination? pagination});

  Future<CrudResult<T>> update(String id, T entity);

  Future<CrudResult<void>> delete(String id);
}
