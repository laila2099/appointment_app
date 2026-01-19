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
      Get.offNamed(route, arguments: args);
    }
    if (Get.key.currentState?.canPop() == true) {
      Get.back();
      return;
    } else {
      Get.offAllNamed(fallbackRoute);
    }
  }

  void cancel() {
    _pendingRoute = null;
    _pendingArgs = null;
    Get.back();
  }

  void clearPending() {
    _pendingRoute = null;
    _pendingArgs = null;
  }

  Future<void> logout() async {
    await prefs.remove(PrefKeys.accessToken);
    await prefs.remove(PrefKeys.refreshToken);
    await prefs.setBool(PrefKeys.isLoggedIn, false);
    await prefs.remove(PrefKeys.userId);
    await prefs.remove(PrefKeys.email);
    await prefs.remove(PrefKeys.expiresAt);
    await prefs.setBool(PrefKeys.isVerified, false);
    clearPending();
  }

  Future<void> handleUnauthorized() async {
    await logout();
    final currentRoute = Get.currentRoute;
    if (currentRoute == AppRoutes.bottomnavbar ||
        currentRoute == AppRoutes.home) {
      Get.offAllNamed(AppRoutes.bottomnavbar);
      return;
    } else if (currentRoute == AppRoutes.doctorDetails) {
      Get.offAllNamed(AppRoutes.bottomnavbar);
    }
    Get.toNamed(
      AppRoutes.loginRequiredGate,
      arguments: {'sessionExpired': true},
    );
  }
}
