import 'package:appoitment_app/bindings/initial_binding.dart';
import 'package:appoitment_app/core/translations/app_translations.dart';
import 'package:appoitment_app/routes/app_pages.dart';
import 'package:appoitment_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          initialBinding: InitializeBinding(),
          initialRoute: AppRoutes.splash,
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          getPages: appPages,
        );
      },
    );
  }
}
