
import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/text_style.dart';
import 'package:appoitment_app/views/settings_section/settings_controller/help_controllers.dart';
import 'package:appoitment_app/views/settings_section/settings_view/widgets/settings_header.dart';
import 'package:appoitment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appoitment_app/widgets/general_widgets/custom_divider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  HelpPage({super.key});

  final HelpController controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SettingsHeader(
            title: "faq".tr,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 20),
              itemCount: controller.faqs.length,
              separatorBuilder: (_, __) => const CustomDivider(),
              itemBuilder: (context, index) {
                return Obx(() {
                  final isExpanded = controller.expandedIndex.value == index;

                  return  InkWell(
  onTap: () => controller.toggle(index),
  child: Padding(
    padding: EdgeInsets.fromLTRB(
      24.w,
      12,
      24.w,
      12,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                controller.faqs[index]['q']!,
                style: CustomTextStyles.body14,
              ),
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
          Text(
            controller.faqs[index]['a']!,
            style: CustomTextStyles.body14.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
        ],
      ],
    ),
  ),
);

                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
