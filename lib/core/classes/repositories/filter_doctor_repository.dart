import 'package:appointment_app/views/home_section/recommendation_doctor/models/sort_model.dart';

import '../api/api.dart';
import '../api/api_endpoints.dart';
import '../api/api_result.dart';

class FilterDoctorRepository {
  final ApiClient api;

  FilterDoctorRepository({required this.api});

  Future<ApiResult<List<SortModel>>> filterDoctors() {
  return api.get<List<SortModel>>(
    endpoint: ApiEndpoints.filterDoctors("e4ba33b5-1413-4547-9532-5683bb0515e9"),
    parser: (json) {
        if (json is List) {
          return json.map((item) {
            final map = item as Map<String, dynamic>;
            return SortModel(
              title: map['specialization'] as String? ?? '',
            );
          }).toList();
        }
        return [];
    },
  );
}

}
