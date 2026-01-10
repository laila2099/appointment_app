import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/text_style.dart';
import '../../../routes/app_routes.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.onboarding);
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:[
        Center(
          child: SizedBox(
            height: 443,
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.05),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),

          // شعار ونص
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                "Docdoc",
                style: CustomTextStyles.headline.copyWith(
                  fontSize: 80,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
