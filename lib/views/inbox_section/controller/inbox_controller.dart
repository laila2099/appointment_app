import 'package:get/get.dart';
import '../model/inbox_model.dart';

class InboxController extends GetxController {
  RxList<InboxModel> inboxList = <InboxModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadInbox();
  }

  void loadInbox() {
    inboxList.addAll([
      InboxModel(
        name: 'Dr. Randy Wigham',
        message: 'Fine, I’ll do a check...',
        time: '7:11 PM',
        image: 'assets/images/doctor1.png',
        unreadCount: 2,
      ),
      InboxModel(
        name: 'Dr. Jack Sulivan',
        message: 'Fine, I’ll do a check...',
        time: '7:11 PM',
        image: 'assets/images/doctor3.png',
        unreadCount: 2,
      ),
      InboxModel(
        name: 'Dr. Emery Lubin',
        message: 'Fine, I’ll do a check...',
        time: '7:11 PM',
        image: 'assets/images/doctor4.png',
        unreadCount: 0,
      ),
      InboxModel(
        name: 'Dr.Hanna Stanton',
        message: 'Fine, I’ll do a check...',
        time: '7:11 PM',
        image: 'assets/images/doctor5.png',
        unreadCount: 2,
      ),
    ]);
  }
}
