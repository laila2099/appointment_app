import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message_model.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  var newMessage = ''.obs;
  var newMessageController = TextEditingController();

  @override
  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add(Message(text: text, time: DateTime.now(), isUser: true));

    Future.delayed(Duration(seconds: 1), () {
      messages
          .add(Message(text: "fine".tr, time: DateTime.now(), isUser: false));
    });
    newMessage.value = '';
  }

  @override
  void onClose() {
    // TODO: implement onClose
    newMessageController.dispose();
    super.onClose();
  }
}
