import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';
import '../../../widgets/general_widgets/app_bar/app_bar.dart';
import '../../../widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import '../../../widgets/search/search_text_field.dart';

import '../controller/inbox_controller.dart';
import '../widget/inbox_item.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: const CustomAppBar(
        titel: 'Message',
        showAction: true,
        actionicon: Icon(Icons.add),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            /// 🔍 reusable search widget
            const SearchTextField(
              hintText: 'Search Message',
            ),

            SizedBox(height: 20.h),

            /// 📩 Inbox list
            Expanded(
              child: Obx(
                    () => ListView.separated(
                  itemCount: controller.inboxList.length,
                  itemBuilder: (context, index) {
                    return InboxItem(
                      model: controller.inboxList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.separator,
                      thickness: 1,
                      height: 12.h,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
