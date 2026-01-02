import 'package:appoitment_app/widgets/helpful_widgets/logout_dialog.dart';
import 'package:get/get.dart';


void showLogoutDialog() {
  Get.dialog(
    const LogoutDialog(),
    barrierDismissible: false,
  );
}
