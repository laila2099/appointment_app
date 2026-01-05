import 'package:get/get.dart';

import '../../../../core/constant/app_keys.dart';
import '../../../../core/services/shared_prefrences.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  bool get isLoggedIn => _prefs.getBool(PrefKeys.isLoggedIn) ?? false;

  final AppPreferencesService _prefs = Get.find<AppPreferencesService>();

  final pendingProtectedIndex = RxnInt();

  final Set<int> protectedTabs = {1, 2, 3, 4};

  void changeIndex(
    int index,
  ) {
    final isLoggedIn = _prefs.getBool(PrefKeys.isLoggedIn) ?? false;
    if (index == _selectedIndex.value) return;

    if (!isLoggedIn && protectedTabs.contains(index)) {
      pendingProtectedIndex.value = index;
      _selectedIndex.value = index;
      return;
    }

    pendingProtectedIndex.value = null;
    _selectedIndex.value = index;
  }

  void unlockAfterLogin() {
    pendingProtectedIndex.value = null;
  }
}
