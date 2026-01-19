import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../controller/chat_controller.dart';

class ChatView extends StatelessWidget {
  final controller = Get.find<ChatController>();

  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final doctorName = args['name'] ?? 'Dr. Jack Sullivan';

    const Color iconColor = Color(0xFF333333);

    return Scaffold(
      appBar: CustomAppBar(
        titel: doctorName,
        subTitle: 'online',
        showAction: true,
        actionicon: const Icon(CupertinoIcons.video_camera, color: iconColor),
        onactiontap: () {
          print('Video call tapped!');
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller
                      .messages[controller.messages.length - 1 - index];
                  final timeStr = DateFormat('HH:mm').format(message.time);

                  return Align(
                    alignment: message.isUser
                        ? AlignmentDirectional.centerEnd
                        : AlignmentDirectional.centerStart,
                    child: Column(
                      crossAxisAlignment: message.isUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: message.isUser
                                ? const Color(0xFF1B75FE)
                                : Colors.white,
                            border: message.isUser
                                ? null
                                : Border.all(
                                    color: const Color(0xFFEEEEEE), width: 1),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: message.isUser
                                  ? const Radius.circular(16)
                                  : Radius.zero,
                              bottomRight: message.isUser
                                  ? Radius.zero
                                  : const Radius.circular(16),
                            ),
                            boxShadow: message.isUser
                                ? []
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              fontSize: 15,
                              color: message.isUser
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          timeStr,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 25, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: TextField(
                      controller: controller.newMessageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message ...',
                        hintStyle: const TextStyle(
                            color: Color(0xFF9E9E9E), fontSize: 15),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: const Icon(
                          CupertinoIcons.smiley,
                          color: iconColor,
                          size: 24,
                        ),
                        suffixIcon: SizedBox(
                          width: 85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                CupertinoIcons.paperclip,
                                color: iconColor,
                                size: 22,
                              ),
                              SizedBox(width: 12),
                              Icon(
                                CupertinoIcons.camera,
                                color: iconColor,
                                size: 22,
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Obx(() {
                  final hasText =
                      controller.newMessageController.text.isNotEmpty;
                  return GestureDetector(
                    onTap: () {
                      if (hasText) {
                        controller
                            .sendMessage(controller.newMessageController.text);
                        controller.newMessageController.clear();
                      }
                    },
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1B75FE),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        hasText ? CupertinoIcons.paperplane_fill : Icons.mic,
                        color: Colors.white,
                        size: 26,
                      ),
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
