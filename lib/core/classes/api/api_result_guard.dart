import 'package:get/get.dart';

import '../../services/auth_gate_service.dart';
import 'api_result.dart';

extension ApiResultGuard<T> on ApiResult<T> {
  Future<bool> guardUnauthorized() async {
    if (this is! ApiFailure<T>) return false;
    final err = (this as ApiFailure<T>).error;

    final msg = err.message.toLowerCase();
    final unauthorized = err.type == ApiErrorType.unauthorized ||
        msg.contains('session has expired') ||
        msg.contains('jwt expired') ||
        msg.contains('invalid jwt');

    if (!unauthorized) return false;

    try {
      await Get.find<AuthGateService>().handleUnauthorized();
      return true;
    } catch (_) {
      return false;
    }
  }
}
