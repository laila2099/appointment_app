import 'package:get/get.dart';

import '../../../widgets/helpful_widgets/logout_dialog.dart';

void showLogoutDialog() {
  Get.dialog(
    const LogoutDialog(),
    barrierDismissible: false,
  );
}
