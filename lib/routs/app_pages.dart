import 'package:appoitment_app/routs/app_routs.dart';
import 'package:appoitment_app/view/splash_screen/splach_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
];
