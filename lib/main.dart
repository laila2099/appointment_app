import 'package:appoitment_app/bindings/initial_binding.dart';
import 'package:appoitment_app/core/translations/app_translations.dart';
import 'package:appoitment_app/routes/app_pages.dart';
import 'package:appoitment_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/constant/app_theme.dart';
import 'core/services/initialize_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialBinding: InitializeBinding(),
          initialRoute: AppRoutes.myAppoitment,
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          getPages: appPages,
        );
      },
    );
  }
}
