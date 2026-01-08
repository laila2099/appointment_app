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

    final seen = prefs.getBool(PrefKeys.hasSeenOnboarding) ?? false;

    if (!seen) {
      return const RouteSettings(name: AppRoutes.onboarding);
    }

    return const RouteSettings(name: AppRoutes.bottomnavbar);
  }
}
