import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:appointment_app/models/appoitments_details.dart';
import 'package:appointment_app/routes/app_routes.dart';
import 'package:appointment_app/views/my_apponiment_section/widgets/appoitment_status.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_button.dart';
import 'package:appointment_app/widgets/general_widgets/app_header/header_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../my_appoitment_controller/my_appoitment_controller.dart';

class AppointmentView extends GetView<MyAppointmentsController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              AppHeader(
                center: HeaderTitle("Appointments"),
                trailing: HeaderButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.search);
                  },
                  child: SvgPicture.asset(
                    AppIcons.search,
                    width: 22.sp,
                    height: 22.sp,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: TabBar(
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.lightGrey,
                  indicatorColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: CustomTextStyles.custom(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                  unselectedLabelStyle: CustomTextStyles.custom(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey,
                  ),
                  tabs: [
                    Tab(text: "Upcoming".tr),
                    Tab(text: "Completed".tr),
                    Tab(text: "Cancelled".tr),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBarView(
                    children: [
                      AppoitmentStatus(status: AppointmentStatus.upcoming),
                      AppoitmentStatus(status: AppointmentStatus.completed),
                      AppoitmentStatus(status: AppointmentStatus.cancelled),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
