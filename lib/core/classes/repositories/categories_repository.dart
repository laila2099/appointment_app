import 'package:appointment_app/views/home_section/home_screen/model/category_model.dart';

import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_result.dart';

class CategoriesRepository {
  final ApiClient api;

  CategoriesRepository({required this.api});

  Future<ApiResult<List<CategoryModel>>> getCategories() {
    return api.get<List<CategoryModel>>(
      endpoint: ApiEndpoints.getCategories(),
      parser: (json) {
        if (json is List) {
          return json.map((item) {
            final map = item as Map<String, dynamic>;
            return CategoryModel(
              icon: map['image_url'] as String? ?? '',
              title: map['name'] as String? ?? '',
            );
          }).toList();
        }
        return [];
      },
    );
  }
}
