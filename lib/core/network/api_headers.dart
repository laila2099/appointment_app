import '../config/app_config.dart';

class ApiHeaders {
  ApiHeaders._();

  static Map<String, String> public() => {
        'apikey': AppConfig.apikey,
      };

  static Map<String, String> authed(String accessToken) => {
        'apikey': AppConfig.apikey,
        'Authorization': 'Bearer $accessToken',
      };
}
