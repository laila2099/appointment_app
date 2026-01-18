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
        message:
            'Fine, I\'ll do a check. Does the patient have a history of certain diseases?',
        time: '7:11 PM',
        image: 'assets/images/doctor1.png',
        unreadCount: 2,
        speciality: 'General Doctor | RSUD Gatot Subroto',
      ),
      InboxModel(
        name: 'Dr. Jack Sulivan',
        speciality: 'General Doctor | RSUD Gatot Subroto',
        message:
            'Fine, I\'ll do a check. Does the patient have a history of certain diseases?',
        time: '7:11 PM',
        image: 'assets/images/doctor3.png',
        unreadCount: 2,
      ),
      InboxModel(
        name: 'Dr. Emery Lubin',
        speciality: 'General Doctor | RSUD Gatot Subroto',
        message:
            'Fine, I\'ll do a check. Does the patient have a history of certain diseases?',
        time: '7:11 PM',
        image: 'assets/images/doctor4.png',
        unreadCount: 0,
      ),
      InboxModel(
        name: 'Dr.Hanna Stanton',
        speciality: 'General Doctor | RSUD Gatot Subroto',
        message:
            'Fine, I\'ll do a check. Does the patient have a history of certain diseases?',
        time: '7:11 PM',
        image: 'assets/images/doctor5.png',
        unreadCount: 2,
      ),
    ]);
  }
}
