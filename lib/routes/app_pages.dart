import 'package:appoitment_app/routes/app_routes.dart';
import 'package:appoitment_app/views/my_apponiment_section/my_appoitment_binding/my_appoitment_binding.dart';
import 'package:appoitment_app/views/my_apponiment_section/my_appoitment_view/my_appoitment_view.dart';
import 'package:appoitment_app/views/my_apponiment_section/reschedule/reschedule_view.dart';
import 'package:appoitment_app/views/home_section/booking_appointment/booking_appointment_binding/booking_binding.dart';
import 'package:appoitment_app/views/home_section/booking_appointment/booking_appointment_view/booking_confirmed_view.dart';
import 'package:appoitment_app/views/home_section/booking_appointment/booking_appointment_view/booking_flow_view.dart';
import 'package:appoitment_app/views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import 'package:appoitment_app/views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';

import 'package:appoitment_app/views/settings_section/settings_view/faq_view.dart';
import 'package:appoitment_app/views/settings_section/settings_view/notification_view.dart';

import 'package:appoitment_app/views/profile_section/profile_view/profile_views.dart';
import 'package:appoitment_app/views/settings_section/settings_view/security_view.dart';
import 'package:appoitment_app/views/settings_section/settings_view/setting_view.dart';
import 'package:appoitment_app/views/splash_screen/splash_screen_view/splash_screen_view.dart';
import 'package:get/get.dart';

final appPages = <GetPage>[
  GetPage(name: AppRoutes.splash, page: () => SplashScreen()),

  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => const DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),

  GetPage(name: AppRoutes.profile, page: () => ProfileView()),
  GetPage(name: AppRoutes.settingsPage, page: () => SettingsPage()),
  GetPage(name: AppRoutes.notificayionPage, page: () => NotificationPage()),
  GetPage(name: AppRoutes.faqPage, page: () => FaqPage()),
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
