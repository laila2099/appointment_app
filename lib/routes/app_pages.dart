import 'package:appoitment_app/routes/app_routes.dart';
import 'package:appoitment_app/views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import 'package:appoitment_app/views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';

import 'package:appoitment_app/views/profile_section/views/profile_views.dart';
import 'package:appoitment_app/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  GetPage(name: AppRoutes.profile, page: () => const ProfileView()),

  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => const DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),

];
