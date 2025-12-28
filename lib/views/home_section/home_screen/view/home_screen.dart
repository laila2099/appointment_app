import 'package:app_appointment/core/constant/app_colors.dart';
import 'package:app_appointment/core/constant/text_style.dart';
import 'package:app_appointment/views/home_section/doctor_speciality_screen/views/doctor_specialitys_screen.dart';
import 'package:app_appointment/views/home_section/home_screen/controller/category_controller.dart';
import 'package:app_appointment/views/home_section/home_screen/controller/doctor_controller.dart';
import 'package:app_appointment/views/home_section/home_screen/widgets/category_item.dart';
import 'package:app_appointment/views/home_section/home_screen/widgets/custom_container.dart';
import 'package:app_appointment/views/home_section/home_screen/widgets/doctor_card.dart';
import 'package:app_appointment/views/home_section/notification/views/notification_screen.dart';
import 'package:app_appointment/views/home_section/recommendation_doctor/views/recommendation_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(CategoryController());
  final doctorcontroller = Get.put(DoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            SizedBox(
              height: 72.h,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Hi, Zaid", style: CustomTextStyles.bold),
                      SizedBox(height: 5.h),
                      Text(
                        "How Are You Today?!",
                        style: CustomTextStyles.subtitle,
                      ),
                    ],
                  ),
                  Spacer(),

                  Stack(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF5F9FF),
                        ),
                        child: Center(
                          child: IconButton(
                            color: AppColors.black,
                            onPressed: () {
                              Get.to(NotificationScreen());
                            },
                            icon: Icon(Icons.notifications_none),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 15.w,
                        top: 13.h,
                        child: Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomContainer(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Doctor Speciality", style: CustomTextStyles.screenTitle),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.to(DoctorSpecialitysScreen());
                  },
                  child: Text("See All", style: CustomTextStyles.regular),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final item = controller.categories[index];
                  return Row(
                    children: [
                      CategoryItem(iconPath: item.icon, title: item.title),
                      SizedBox(width: 25.w),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation Doctor",
                  style: CustomTextStyles.screenTitle,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.to(RecommendationDoctorScreen());
                  },
                  child: Text("See All", style: CustomTextStyles.regular),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: doctorcontroller.doctors.length,
                itemBuilder: (context, index) {
                  final d = doctorcontroller.doctors[index];
                  return DoctorCard(
                    image: d.image,
                    name: d.name,
                    department: d.department,
                    hospital: d.hospital,
                    rating: d.rating,
                    reviews: d.reviews,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
