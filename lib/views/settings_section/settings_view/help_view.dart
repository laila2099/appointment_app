import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/views/settings_section/settings_controller/help_controllers.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  HelpPage({super.key});

  final HelpController controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppHeader(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        center: Text(
          "Notification",
          style: CustomTextStyles.screenTitle,
        ),
        trailing: Text(""),
      ),
      body: ListView.separated(
        itemCount: controller.faqs.length,
        separatorBuilder: (_, __) => const CustomDivider(),
        itemBuilder: (context, index) {
          return Obx(() {
            final isExpanded = controller.expandedIndex.value == index;

            return InkWell(
              onTap: () => controller.toggle(index),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(controller.faqs[index]['q']!,
                              style: CustomTextStyles.body14),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.lightGrey,
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 12),
                      Text(controller.faqs[index]['a']!,
                          style: CustomTextStyles.body14
                              .copyWith(color: AppColors.lightGrey)),
                    ],
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
