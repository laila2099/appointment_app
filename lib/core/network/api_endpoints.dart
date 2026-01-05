import '../config/app_config.dart';

class ApiEndpoints {
  ApiEndpoints._();

  // -------- Auth
  static const String signUp = '/auth/v1/signup';
  static const String token = '/auth/v1/token';

  static String signUpWithKey() => '$signUp?apikey=${AppConfig.apikey}';
  static String loginPassword() => '$token?grant_type=password';

  // -------- REST
  static const String profiles = '/rest/v1/profiles';
  static const String categories = '/rest/v1/categories';
  static const String doctorsWithReviews = '/rest/v1/doctors_with_reviews';
  static const String appointments = '/rest/v1/appointments';
  static const String appointmentsWithDoctor =
      '/rest/v1/appointments_with_doctor';
}
