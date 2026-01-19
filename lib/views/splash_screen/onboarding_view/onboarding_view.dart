import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_keys.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/services/shared_prefrences.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/helpful_widgets/primary_button_widget.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Get.find<AppPreferencesService>();

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 35.w,
                      height: 35.h,
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      "Docdoc",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Stack(
                  children: [
                    Positioned(
                      left: -79,
                      top: 140,
                      child: Transform.rotate(
                        angle: math.pi,
                        child: Opacity(
                          opacity: 0.06,
                          child: Image.asset(
                            AppImages.rightLogo,
                            width: 309.38.w,
                            height: 340.05.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 47.95,
                      right: 10,
                      top: 5,
                      child: Opacity(
                        opacity: 0.06,
                        child: Image.asset(
                          AppImages.rightLogo,
                          width: 306.38.w,
                          height: 340.05.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.onboardingDoctor,
                      width: double.infinity,
                      height: 555.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 180.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 32,
                      right: 32,
                      child: Column(
                        children: [
                          Text("Best Doctor\nAppointment App".tr,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.headline32Bold
                                  .copyWith(fontWeight: FontWeight.w900)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: const EdgeInsets.only(right: 32, left: 32),
                  child: Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience."
                        .tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.custom(
                        fontSize: 10.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subtitle),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: const EdgeInsets.only(right: 32, left: 32),
                  child: CustomPrimaryButton(
                    label: "Get Started".tr,
                    onTap: () {
                      Get.offAllNamed(AppRoutes.createAccount);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    prefs.setBool(PrefKeys.hasSeenOnboarding, true);
                    Get.offAllNamed(AppRoutes.bottomnavbar);
                  },
                  child: Text("Continue as a Visitor"),
                )
              ],
            ),
          ),
        ));
  }
}
