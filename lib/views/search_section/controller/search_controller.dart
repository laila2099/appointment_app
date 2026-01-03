import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewController extends GetxController {
  var searchController = TextEditingController();
  var recentSearches = <String>[
    'Dental',
    'General Medical Check',
    'Nearest Hospital',
    'Neurologic',
  ].obs;

  void addSearch(String query) {
    if (!recentSearches.contains(query)) {
      recentSearches.add(query);
    }
  }

  void clearHistory() {
    recentSearches.clear();
  }

  void removeSearch(String query) {
    recentSearches.remove(query);
  }
}
