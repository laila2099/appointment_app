import 'package:app_appointment/routes/app_routes.dart';
import 'package:app_appointment/views/home_section/home_screen/view/home_screen.dart';
import 'package:app_appointment/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

import '../views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import '../views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => const DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),

];
