import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../core/constant/app_colors.dart';
import '../core/services/auth_gate_service.dart';
import 'general_widgets/primary_button.dart';

class LoginRequiredGate extends StatelessWidget {
  const LoginRequiredGate({super.key});

  @override
  Widget build(BuildContext context) {
    final gate = Get.find<AuthGateService>();
    final args = Get.arguments as Map<String, dynamic>?;
    final notBottomNav = (args?['notBottomNav'] as bool?) ?? false;
    return WillPopScope(
      onWillPop: () async {
        gate.cancel();
        return false;
      },
      child: Scaffold(
        appBar: notBottomNav
            ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: gate.cancel,
                ),
                centerTitle: true,
                title: Text('login_required_title'.tr),
              )
            : null,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 56.w,
                  color: AppColors.primary,
                ),
                SizedBox(height: 12.h),
                Text(
                  'login_required_title'.tr,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  'login_required_subtitle'.tr,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () => Get.offNamed(AppRoutes.login),
                    text: 'login'.tr,
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
                  ),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () => Get.offNamed(AppRoutes.createAccount),
                  child: Text('Create Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
