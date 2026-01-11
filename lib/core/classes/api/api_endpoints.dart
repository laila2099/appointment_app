import '../../config/app_config.dart';

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

  // -------- Profiles
  static String getProfile(String userId, {String select = '*'}) =>
      '$profiles?id=eq.$userId&select=$select&apikey=${AppConfig.apikey}';

  static String editProfile(String userId) =>
      '$profiles?id=eq.$userId&apikey=${AppConfig.apikey}';

  // -------- Categories
  static String getCategories({String select = '*'}) =>
      '$categories?select=$select&apikey=${AppConfig.apikey}';

  // -------- Doctors

  static String getAllDoctors({String select = '*'}) =>
      '$doctorsWithReviews?select=$select';
  
  static String getRecommendedDoctors({String select = '*'}) =>
      '$doctorsWithReviews?is_recommended=eq.true&select=$select';
  
  static String getDoctorById(String doctorId, {String select = '*'}) =>
      '$doctorsWithReviews?id=eq.$doctorId&select=$select';

  
  static String searchDoctors(String query, {String select = '*'}) {
    final encodedQuery = Uri.encodeComponent(query);
    return '$doctorsWithReviews?name=ilike.%25$encodedQuery%25&select=$select';
  }
  
  static String getDoctorsBySpecialty(String specialty, {String select = '*'}) =>
      '$doctorsWithReviews?specialty=eq.$specialty&select=$select';

  // -------- Reviews
  static const String reviews = '/rest/v1/reviews';
  
  static String getReviewsByDoctorId(String doctorId, {String select = '*'}) =>
      '$reviews?doctor_id=eq.$doctorId&select=$select&order=created_at.desc';

  static String getAllReviews({String select = '*'}) =>
      '$reviews?select=$select&order=created_at.desc';

  static String getReviewById(String reviewId, {String select = '*'}) =>
      '$reviews?id=eq.$reviewId&select=$select';

  static String filterDoctors(String categoryId) =>
      '$doctorsWithReviews?category_id=eq.$categoryId&apikey=${AppConfig.apikey}';


  // -------- Appointments
  static String filterAppointments(String status) =>
      '$appointmentsWithDoctor?status=eq.$status&apikey=${AppConfig.apikey}';

  static String editAppointment(String appointmentId) =>
      '$appointments?id=eq.$appointmentId&apikey=${AppConfig.apikey}';
}
