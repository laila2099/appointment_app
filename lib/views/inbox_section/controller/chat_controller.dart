import 'package:get/get.dart';
import '../model/message_model.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  var newMessage = ''.obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add(Message(text: text, time: DateTime.now(), isUser: true));

    Future.delayed(Duration(seconds: 1), () {
      messages
          .add(Message(text: "fine".tr, time: DateTime.now(), isUser: false));
    });
  }
}
