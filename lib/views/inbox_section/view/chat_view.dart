import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../controller/chat_controller.dart';

class ChatView extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titel: 'Dr. Randy Wigham',
        subTitle: 'online',
        showAction: true,
        actionicon: Icon(Icons.video_call, color: Colors.grey),
        onactiontap: () {
          print('Video call tapped!');
        },
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller
                        .messages[controller.messages.length - 1 - index];
                    final timeStr = DateFormat('h:mm a').format(message.time);

                    return Align(
                      alignment: message.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: message.isUser
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message.isUser
                                  ? AppColors.primary
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: message.isUser
                                    ? AppColors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              timeStr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    print('Emoji tapped!');
                  },
                  icon: Icon(Icons.emoji_emotions_outlined,
                      color: AppColors.lightGrey),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        onChanged: (val) => controller.newMessage.value = val,
                        decoration: InputDecoration(
                          hintText: 'Type a message ...',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('Attach file tapped!');
                            },
                            icon: Icon(Icons.attach_file,
                                color: AppColors.lightGrey),
                          ),
                          IconButton(
                            onPressed: () {
                              print('Camera tapped!');
                            },
                            icon: Icon(Icons.camera_alt,
                                color: AppColors.lightGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Obx(() {
                  final hasText = controller.newMessage.value.trim().isNotEmpty;
                  return FloatingActionButton(
                    backgroundColor: AppColors.primary,
                    onPressed: () {
                      if (hasText) {
                        controller.sendMessage(controller.newMessage.value);
                        controller.newMessage.value = '';
                      } else {
                        print('Start voice recording...');
                      }
                    },
                    child: Icon(
                      hasText ? Icons.send : Icons.mic,
                      color: AppColors.white,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
