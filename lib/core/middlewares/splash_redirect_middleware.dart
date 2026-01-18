import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../constant/app_keys.dart';
import '../services/shared_prefrences.dart';

class SplashRedirectMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    final prefs = Get.find<AppPreferencesService>();

    if (route == AppRoutes.splash) return null;

    final isLoggedIn = prefs.getBool(PrefKeys.isLoggedIn) ?? false;
    final isVerified = prefs.getBool(PrefKeys.isVerified) ?? false;

    print(isVerified);

    if (!isVerified) {
      return const RouteSettings(name: AppRoutes.otpVerification);
    } else if (isLoggedIn && isVerified) {
      return const RouteSettings(name: AppRoutes.bottomnavbar);
    }

    final hasSeenOnboarding =
        prefs.getBool(PrefKeys.hasSeenOnboarding) ?? false;
    if (!hasSeenOnboarding) {
      return const RouteSettings(name: AppRoutes.onboarding);
    }

    return const RouteSettings(name: AppRoutes.onboarding);
  }
}
