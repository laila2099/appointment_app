import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  int _lastIndex = 0;

  void changeIndex(int index) {
    if (index != _selectedIndex.value) {
      _lastIndex = _selectedIndex.value;
      _selectedIndex.value = index;
    }
  }

  void goBack() {
    _selectedIndex.value = _lastIndex;
  }
}
