import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../core/constant/app_keys.dart';
import '../../core/services/auth_gate_service.dart';
import '../../core/services/shared_prefrences.dart';
import '../../routes/app_routes.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "You'll need to enter your username\nand password next time\nyou want to login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: const Color(0xFF242424),
                height: 1.4,
              ),
            ),
            SizedBox(height: 24.h),
            Divider(height: 1),
            SizedBox(
              height: 44.h,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(width: 1),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final prefs = Get.find<AppPreferencesService>();
                        await prefs.remove(PrefKeys.accessToken);
                        await prefs.remove(PrefKeys.refreshToken);
                        await prefs.remove(PrefKeys.expiresAt);
                        await prefs.remove(PrefKeys.userId);
                        await prefs.setBool(PrefKeys.isLoggedIn, false);

                        Get.find<AuthGateService>().logout();
                        Get.offAllNamed(AppRoutes.bottomnavbar);
                      },
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
