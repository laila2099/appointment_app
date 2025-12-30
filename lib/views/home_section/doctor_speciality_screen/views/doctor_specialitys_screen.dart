import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/views/home_section/home_screen/controller/category_controller.dart';
import 'package:app_appointment/views/home_section/home_screen/widgets/category_item.dart';
import 'package:app_appointment/widgets/general_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorSpecialitysScreen extends StatelessWidget {
  DoctorSpecialitysScreen({super.key});
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(titel: 'Doctor Speciality'),
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                itemCount: controller.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 32.h,
                  crossAxisSpacing: 36.w,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = controller.categories[index];
                  return CategoryItem(iconPath: item.icon, title: item.title);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
