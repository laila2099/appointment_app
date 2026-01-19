import 'package:get/get.dart';

import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/shared_prefrences.dart';

class NavigationController extends GetxController {
  final AppPreferencesService _prefs = Get.find<AppPreferencesService>();

  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  bool get isLoggedIn => _prefs.getBool(PrefKeys.isLoggedIn) ?? false;

  final Set<int> protectedTabs = {1, 2, 3, 4};

  final RxnInt pendingProtectedIndex = RxnInt();

  void changeIndex(int index) {
    if (index == _selectedIndex.value) return;

    final loggedIn = _prefs.getBool(PrefKeys.isLoggedIn) ?? false;

    if (!loggedIn && protectedTabs.contains(index)) {
      pendingProtectedIndex.value = index;
      _selectedIndex.value = index;
      return;
    }

    pendingProtectedIndex.value = null;
    _selectedIndex.value = index;
  }

  bool handleBack() {
    if (_selectedIndex.value != 0) {
      _selectedIndex.value = 0;
      return false;
    }
    return true;
  }

  void changeTab(int index) {
    _selectedIndex.value = index;
  }

  void unlockAfterLogin() {
    pendingProtectedIndex.value = null;
  }
}
