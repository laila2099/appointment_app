
import 'package:app_appointment/core/classes/crud/crud_repository.dart';
import 'package:app_appointment/core/classes/crud/crud_result.dart';
import 'package:app_appointment/core/classes/crud/pagination.dart';
import 'package:get/get.dart';

abstract class CrudController<T> extends GetxController {
  final CrudRepository<T> repository;

  CrudController(this.repository);

  final RxList<T> items = <T>[].obs;
  final RxBool isLoading = false.obs;
  final Rxn<CrudError> error = Rxn();

  Future<void> fetchAll({Pagination? pagination}) async {
    isLoading.value = true;
    error.value = null;

    final result = await repository.readAll(pagination: pagination);

    if (result is CrudSuccess<List<T>>) {
      items.assignAll(result.data);
    } else if (result is CrudFailure<List<T>>) {
      error.value = result.error;
    }

    isLoading.value = false;
  }

  Future<bool> deleteItem(String id) async {
    final result = await repository.delete(id);

    if (result is CrudFailure<void>) {
      error.value = result.error;
      return false;
    }
    return true;
  }
}
