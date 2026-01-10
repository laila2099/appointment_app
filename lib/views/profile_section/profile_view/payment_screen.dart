import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_icons.dart';
import '../../../widgets/general_widgets/app_header/app_header.dart';
import '../../../widgets/general_widgets/app_header/header_button.dart';
import '../../../widgets/general_widgets/primary_button.dart';
import '../profile_controller/payment_controller.dart';
import 'widgets/wallets_item.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              trailing: HeaderButton(
                child: SvgPicture.asset(
                  AppIcons.scanner,
                  width: 22.sp,
                  height: 22.sp,
                  colorFilter: const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
              center: const Text('Payment'),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () => Column(
                    children: List.generate(
                      controller.wallets.length,
                      (index) => WalletContainerItem(
                        wallet: controller.wallets[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
            PrimaryButton(
              text: "Add New",
              onPressed: () {
                Get.back();
              },
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
            ),
          ],
        ),
      ),
    );
  }
}
