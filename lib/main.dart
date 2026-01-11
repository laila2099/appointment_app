import 'package:appointment_app/core/translations/controller/translation_controller.dart';
import 'package:appointment_app/routes/app_pages.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'bindings/initial_binding.dart';
import 'core/constant/app_theme.dart';
import 'core/services/initialize_service.dart';
import 'core/translations/app_translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  Get.put(TranslationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final translationController = Get.find<TranslationController>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialBinding: InitializeBinding(),
          initialRoute: AppRoutes.splash,
          translations: AppTranslations(),
          locale: translationController.locale.value,
          fallbackLocale: const Locale('en', 'US'),
          getPages: appPages,
        );
      },
    );
  }
}
