import 'package:appointment_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  final searchController = TextEditingController();
  var recentSearches = <String>[
    'general',
  ].obs;

  void goToSearch(String query) {
    String trimmed = query.trim();
    if (trimmed.isEmpty) return;

    recentSearches.remove(trimmed);
    recentSearches.insert(0, trimmed);

    Get.toNamed(AppRoutes.searchresult, arguments: trimmed);

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
