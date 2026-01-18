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
                    SizedBox(width: 8.w),
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
                            height: 308.05.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 47.95.w,
                      right: 10.w,
                      top: 5.h,
                      child: Opacity(
                        opacity: 0.06,
                        child: Image.asset(
                          AppImages.rightLogo,
                          width: 306.38.w,
                          height: 308.05.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.onboardingDoctor,
                      width: double.infinity,
                      height: 491.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200.h,
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
                      left: 32.w,
                      right: 32.w,
                      child: Column(
                        children: [
                          Text(
                            "Best Doctor\nAppointment App".tr,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.headline32Bold.copyWith(
                              height: 1.5,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                  child: Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience."
                        .tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.subtitle.copyWith(
                      fontSize: 10.sp,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 55.h),
                  child: CustomPrimaryButton(
                    label: "Get Started".tr,
                    onTap: () {
                      prefs.setBool(PrefKeys.hasSeenOnboarding, true);
                      Get.offAllNamed(AppRoutes.bottomnavbar);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
