import 'package:appoitment_app/routes/app_routes.dart';
import 'package:appoitment_app/views/profile_section/views/profile_views.dart';
import 'package:appoitment_app/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
];
