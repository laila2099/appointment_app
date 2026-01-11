import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/views/home_section/home_screen/model/category_model.dart';
import 'package:get/get.dart';

import '../../../../core/classes/repositories/doctor_repository.dart';

class CategoryController extends GetxController {
  final DoctorRepository _repository = Get.find();

  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      errorMessage.value = null;
      final result = await _repository.getCategories();

      if (result is ApiSuccess<List<CategoryModel>>) {
        categories.assignAll(result.data);
      } else if (result is ApiFailure<List<CategoryModel>>) {
        final errorMsg = result.error.message;
        errorMessage.value = errorMsg;
        Get.snackbar("Error", "Failed to load categories: $errorMsg");
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Error", "Exception: $e");
    } finally {
      isLoading(false);
    }
  }

  void retryFetchCategories() {
    fetchCategories();
  }
}
