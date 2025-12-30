import 'package:app_appointment/routes/app_routes.dart';
import 'package:app_appointment/views/home_section/doctor_speciality_screen/views/doctor_specialitys_screen.dart';
import 'package:app_appointment/views/home_section/find_nearby/views/find_nearby_screen.dart';
import 'package:app_appointment/views/home_section/home_screen/view/home_screen.dart';
import 'package:app_appointment/views/home_section/notification/views/notification_screen.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/views/recommendation_doctor_screen.dart';
import 'package:app_appointment/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:app_appointment/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import 'package:app_appointment/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar_binding.dart';
import 'package:app_appointment/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/main_nav_bar.dart';
import 'package:get/get.dart';

import '../views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import '../views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
  GetPage(
    name: AppRoutes.bottomnavbar,
    page: () => MainLayout(),
    binding: BottomNavBarBinding(),
  ),
  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  GetPage(name: AppRoutes.notificationScreen, page: () => NotificationScreen()),
  GetPage(name: AppRoutes.findNearbyScreen, page: () => FindNearbyScreen()),
  GetPage(
    name: AppRoutes.doctorSpecialitysScreen,
    page: () => DoctorSpecialitysScreen(),
  ),
  GetPage(
    name: AppRoutes.recommendationDoctorScreen,
    page: () => RecommendationDoctorScreen(),
  ),
];
