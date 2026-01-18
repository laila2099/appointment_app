import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/recommendation_doctor/controllers/sort_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  final searchController = TextEditingController();
  final sortController = Get.find<SortController>();
  var recentSearches = <String>[
    'general',
  ].obs;

  Future<void> goToSearch(String query) async {
    String trimmed = query.trim();
    if (trimmed.isEmpty) return;

    addSearch(trimmed);

    String effectiveCategoryId = '';
    String? effectiveQuery = trimmed;

    if (trimmed.toLowerCase() == 'general') {
      effectiveCategoryId = '0';
      effectiveQuery = null;
      sortController.selectSpeciality(0);
    } else {
      final matchedCategory = sortController.specialityList.firstWhereOrNull(
          (cat) =>
              cat.title.toLowerCase().trim() == trimmed.toLowerCase() ||
              cat.title.toLowerCase().trim().contains(trimmed.toLowerCase()));

      if (matchedCategory != null &&
          matchedCategory.title.toLowerCase() != 'general') {
        effectiveCategoryId = matchedCategory.id.toString();
        effectiveQuery = null;
        int index = sortController.specialityList.indexOf(matchedCategory);
        sortController.selectSpeciality(index);
      } else {
        sortController.selectSpeciality(0);
      }
    }

    await Get.toNamed(
      AppRoutes.searchresult,
      arguments: {
        'query': effectiveQuery,
        'categoryId': effectiveCategoryId,
      },
    );

    searchController.clear();
  }

  void addSearch(String query) {
    String trimmed = query.trim();
    if (trimmed.isEmpty) return;

    recentSearches.remove(trimmed);
    recentSearches.insert(0, trimmed);
  }

  void removeSearch(String query) => recentSearches.remove(query);
  void clearHistory() => recentSearches.clear();
}
