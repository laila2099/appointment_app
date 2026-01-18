import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsHeader extends StatelessWidget {
  final String title;
  final HeaderButton? trailling;
  const SettingsHeader({super.key, required this.title, this.trailling});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      onBack: Get.back,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 16.w,
      ),
      backgroundColor: AppColors.white,
      center: Text(
        title,
        style: CustomTextStyles.screenTitle,
      ),
      trailing: trailling,
    );
  }
}
