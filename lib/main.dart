import 'package:appoitment_app/bindings/initial_binding.dart';
import 'package:appoitment_app/core/services/shared_prefrences.dart';
import 'package:appoitment_app/routs/app_pages.dart';
import 'package:appoitment_app/routs/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<AppPreferencesService>(
    () async => await AppPreferencesService().init(),
  );
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
          getPages: appPages,
        );
      },
    );
  }
}
