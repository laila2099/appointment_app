import 'package:get/get.dart';
import '../controller/inbox_controller.dart';

class InboxBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController());
  }
}
