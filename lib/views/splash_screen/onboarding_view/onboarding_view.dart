import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_keys.dart';
import '../../../core/constant/text_style.dart';
import '../../../core/services/shared_prefrences.dart';
import '../../../routes/app_routes.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Get.find<AppPreferencesService>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // اللوغو والنص
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Docdoc",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // محتوى قابل للتمرير لو الشاشة صغيرة
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Image.asset(
                            AppImages.onboardingDoctor,
                            width: double.infinity,
                            height: 443,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.bottomCenter,
                                end: AlignmentDirectional.topCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Text(
                              "onboarding_title".tr,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.headline32Bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // الوصف
                      Text(
                        "onboarding_subtitle".tr,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.subtitle2,
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    prefs.setBool(PrefKeys.hasSeenOnboarding, true);
                    Get.offAllNamed(AppRoutes.bottomnavbar);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "get_started".tr,
                    style: CustomTextStyles.button,
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
