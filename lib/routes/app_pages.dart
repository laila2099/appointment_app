import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_binding/booking_binding.dart';
import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_view/booking_confirmed_view.dart';
import 'package:appointment_app/views/home_section/booking_appointment/booking_appointment_view/booking_flow_view.dart';
import 'package:appointment_app/views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import 'package:appointment_app/views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_binding/my_appoitment_binding.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_view/my_appoitment_view.dart';
import 'package:appointment_app/views/my_apponiment_section/reschedule/reschedule_view.dart';
import 'package:appointment_app/views/profile_section/profile_view/profile_view.dart';
import 'package:appointment_app/views/settings_section/settings_view/help_view.dart';
import 'package:appointment_app/views/settings_section/settings_view/notification_view.dart';
import 'package:appointment_app/views/settings_section/settings_view/security_view.dart';
import 'package:appointment_app/views/settings_section/settings_view/setting_view.dart';
import 'package:appointment_app/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

import '../views/home_section/doctor_speciality_screen/views/doctor_specialitys_screen.dart';
import '../views/home_section/find_nearby/views/find_nearby_screen.dart';
import '../views/home_section/home_screen/view/home_screen.dart';
import '../views/home_section/notification/views/notification_screen.dart';
import '../views/home_section/recommendation_doctor/views/recommendation_doctor_screen.dart';
import '../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar_binding.dart';
import '../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/main_nav_bar.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),

  GetPage(
    name: AppRoutes.bottomnavbar,
    page: () => MainLayout(),
    binding: BottomNavBarBinding(),
  ),

  // Home

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

  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => const DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),

//profile
  GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),

  //Settings
  GetPage(name: AppRoutes.settingsPage, page: () => SettingsPage()),
  GetPage(name: AppRoutes.notificationPage, page: () => NotificationPage()),
  GetPage(name: AppRoutes.helpPage, page: () => HelpPage()),
  GetPage(name: AppRoutes.securityPage, page: () => SecurityPage()),

  GetPage(
    name: AppRoutes.bookingAppointment,
    page: () => const BookingFlowScreen(),
    binding: BookingBinding(),
  ),
  GetPage(
    name: AppRoutes.bookingConfirmed,
    page: () => const BookingConfirmedScreen(),
  ),
  GetPage(
    name: AppRoutes.myAppoitment,
    page: () => const AppoitmentView(),
    binding: MyAppoitmentBinding(),
  ),
  GetPage(
    name: AppRoutes.rescedual,
    page: () => const ReschedualScreen(),
    binding: BookingBinding(),
  ),
];
