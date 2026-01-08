import 'package:appointment_app/core/classes/api/api.dart';
import 'package:appointment_app/core/classes/api/api_result.dart';
import 'package:appointment_app/core/classes/repositories/categories_repository.dart';
import 'package:appointment_app/core/config/app_config.dart';
// import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/views/home_section/home_screen/model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late final CategoriesRepository _repository;

  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    _repository = CategoriesRepository(
        api: Get.put(ApiClient(baseUrl: AppConfig.baseUrl)));
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
