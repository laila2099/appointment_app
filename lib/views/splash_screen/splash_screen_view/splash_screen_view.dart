import 'package:appointment_app/core/middlewares/splash_redirect_middleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      final middleware = SplashRedirectMiddleware();

      final RouteSettings? settings = middleware.redirect('check');

      if (settings != null && settings.name != null) {
        Get.offNamed(settings.name!);
      } else {
        Get.offNamed(AppRoutes.onboarding);
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 443,
                child: Image.asset(
                  AppImages.logo,
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.06),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
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
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
