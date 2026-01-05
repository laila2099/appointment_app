import 'package:get/get.dart';

import '../core/middlewares/splash_redirect_middleware.dart';
import '../views/auth_section/bindings/fill_your_profile_binding.dart';
import '../views/auth_section/forgot_password/forgot_password_screens/forgot_password_view.dart';
import '../views/auth_section/forgot_password/forgot_password_screens/otp_verification_view.dart';
import '../views/auth_section/sign_in/sign_in_view.dart';
import '../views/auth_section/sign_up/fill_your_profile_view.dart';
import '../views/auth_section/sign_up/sign_up_view.dart';
import '../views/home_section/booking_appointment/booking_appointment_binding/booking_binding.dart';
import '../views/home_section/booking_appointment/booking_appointment_view/booking_confirmed_view.dart';
import '../views/home_section/booking_appointment/booking_appointment_view/booking_flow_view.dart';
import '../views/home_section/doctor_details/doctor_details_binding/doctor_details_binding.dart';
import '../views/home_section/doctor_details/doctor_details_view/doctor_details_screen.dart';
import '../views/home_section/doctor_speciality_screen/views/doctor_specialitys_screen.dart';
import '../views/home_section/find_nearby/views/find_nearby_screen.dart';
import '../views/home_section/home_screen/view/home_screen.dart';
import '../views/home_section/notification/views/notification_screen.dart';
import '../views/home_section/recommendation_doctor/views/recommendation_doctor_screen.dart';
import '../views/inbox_section/inbox_binding/chat_binding.dart';
import '../views/inbox_section/view/chat_view.dart' show ChatView;
import '../views/inbox_section/view/inbox_view.dart';
import '../views/my_apponiment_section/my_appoitment_binding/my_appoitment_binding.dart';
import '../views/my_apponiment_section/my_appoitment_view/my_appoitment_view.dart';
import '../views/my_apponiment_section/reschedule/reschedule_view.dart';
import '../views/profile_section/profile_binding/profile_binding.dart';
import '../views/profile_section/profile_view/medical_records_screen.dart';
import '../views/profile_section/profile_view/payment_screen.dart';
import '../views/profile_section/profile_view/personal_info.dart';
import '../views/profile_section/profile_view/profile_view.dart';
import '../views/search_section/search_binding/search_binding.dart';
import '../views/search_section/search_binding/search_result_binding.dart';
import '../views/search_section/view/search_result_view.dart';
import '../views/search_section/view/search_view.dart';
import '../views/settings_section/settings_view/help_view.dart';
import '../views/settings_section/settings_view/language_screen.dart';
import '../views/settings_section/settings_view/notification_view.dart';
import '../views/settings_section/settings_view/security_view.dart';
import '../views/settings_section/settings_view/setting_view.dart';
import '../views/splash_screen/onboarding_view/onboarding_view.dart';
import '../views/splash_screen/splash_screen_view/splash_screen_view.dart';
import '../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar_binding.dart';
import '../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/main_nav_bar.dart';
import '../widgets/login_required_gate.dart';
import 'app_routes.dart';

final appPages = <GetPage>[
  // Splash + Onboarding
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
    middlewares: [SplashRedirectMiddleware()],
  ),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoardingView()),

  GetPage(
      name: AppRoutes.loginRequiredGate, page: () => const LoginRequiredGate()),

  // Auth + Reset Password
  GetPage(name: AppRoutes.login, page: () => const LoginView()),
  GetPage(name: AppRoutes.createAccount, page: () => const CreateAccountView()),
  GetPage(
      name: AppRoutes.forgotPassword, page: () => const ForgotPasswordView()),
  GetPage(name: AppRoutes.otpVerification, page: () => OtpVerificationView()),
  GetPage(
      name: AppRoutes.fillYourProfile,
      page: () => const FillYourProfileView(),
      binding: AuthFillProfileBinding()),

  // Doctor Details
  GetPage(
    name: AppRoutes.doctorDetails,
    page: () => const DoctorDetailsScreen(),
    binding: DoctorDetailsBinding(),
  ),

  // Bottom Navigation
  GetPage(
    name: AppRoutes.bottomnavbar,
    page: () => MainLayout(),
    binding: BottomNavBarBinding(),
  ),

  // Home
  GetPage(
    name: AppRoutes.home,
    page: () => HomeScreen(),
  ),
  GetPage(name: AppRoutes.notificationScreen, page: () => NotificationScreen()),
  GetPage(
      name: AppRoutes.findNearbyScreen, page: () => const FindNearbyScreen()),
  GetPage(
      name: AppRoutes.doctorSpecialtiesScreen,
      page: () => DoctorSpecialitysScreen()),
  GetPage(
      name: AppRoutes.recommendationDoctorScreen,
      page: () => RecommendationDoctorScreen()),

  //profile
  GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding()),
  GetPage(
      name: AppRoutes.personalInfo,
      page: () => PersonalInfo(),
      binding: ProfileBinding()),
  GetPage(name: AppRoutes.paymentScreen, page: () => PaymentScreen()),
  GetPage(
      name: AppRoutes.medicalRecordsScreen, page: () => MedicalRecordsScreen()),

  // Settings
  GetPage(name: AppRoutes.settingsPage, page: () => const SettingsPage()),
  GetPage(name: AppRoutes.notificationPage, page: () => NotificationPage()),
  GetPage(name: AppRoutes.helpPage, page: () => HelpPage()),
  GetPage(name: AppRoutes.securityPage, page: () => SecurityPage()),
  GetPage(name: AppRoutes.languageScreen, page: () => LanguageScreen()),

  // Booking
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
    name: AppRoutes.myAppointment,
    page: () => const AppointmentView(),
    binding: MyAppoitmentBinding(),
  ),
  GetPage(
    name: AppRoutes.reschedule,
    page: () => const ReschedualScreen(),
    binding: BookingBinding(),
  ),
  // Inbox Page
  GetPage(
    name: AppRoutes.inbox,
    page: () => const InboxView(), // تأكد إنه عندك InboxScreen موجودة
  ),
  GetPage(
    name: AppRoutes.chat,
    page: () => ChatView(),
    binding: ChatBinding(), // هاد عشان يتحمل ChatController تلقائياً
  ),
  GetPage(
    name: AppRoutes.searchresult, // قم بتحديد اسم URL المناسب
    page: () => const SearchResultView(),
    binding: SearchResultBinding(), // ربط الـ SearchBinding
  ),
  GetPage(
    name: AppRoutes.search,
    page: () => const SearchView(),
    binding: SearchBinding(), // <--- مهم
  ),
];
