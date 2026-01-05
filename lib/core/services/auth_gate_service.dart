import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../constant/app_keys.dart';
import 'shared_prefrences.dart';

class AuthGateService extends GetxService {
  final AppPreferencesService prefs = Get.find<AppPreferencesService>();

  String? _pendingRoute;
  dynamic _pendingArgs;

  bool get isLoggedIn => prefs.getBool(PrefKeys.isLoggedIn) ?? false;

  void goProtected(String route, {dynamic args}) {
    if (isLoggedIn) {
      Get.toNamed(route, arguments: args);
      return;
    }

    _pendingRoute = route;
    _pendingArgs = args;
    Get.toNamed(AppRoutes.loginRequiredGate, arguments: {'notBottomNav': true});
  }

  void goToLoginFromGate() {
    Get.toNamed(AppRoutes.login);
  }

  void continueAfterLogin({String fallbackRoute = AppRoutes.bottomnavbar}) {
    final route = _pendingRoute;
    final args = _pendingArgs;

    _pendingRoute = null;
    _pendingArgs = null;

    if (route != null) {
      Get.offAllNamed(route, arguments: args);
    } else {
      Get.offAllNamed(fallbackRoute);
    }
  }

  void cancel() {
    _pendingRoute = null;
    _pendingArgs = null;
    Get.back();
  }
}
