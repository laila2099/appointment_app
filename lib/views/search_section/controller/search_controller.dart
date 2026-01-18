import 'package:appointment_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  final searchController = TextEditingController();
  var recentSearches = <String>[
    'general',
  ].obs;

  Future<void> goToSearch(String query) async {
    String trimmed = query.trim();
    if (trimmed.isEmpty) return;

    recentSearches.remove(trimmed);
    recentSearches.insert(0, trimmed);

    print(searchController.text);

    final bool? result =
        await Get.toNamed(AppRoutes.searchresult, arguments: trimmed);
    print(result);
    print(searchController.text);
    if (result == true) {
      searchController.clear();
    }
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
