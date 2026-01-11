import 'package:appointment_app/core/constant/app_colors.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile_controller/profile_controller.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Column(
      children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 62,
                backgroundColor: Colors.white,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.avatar),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF8F8F8),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 24,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Obx(
          () => Text(
            controller.profile.value?.name ?? '',
            style: CustomTextStyles.profileTitle,
          ),
        ),
        Obx(
          () => Text(
            controller.profile.value?.email ?? '',
            style: CustomTextStyles.subTitle,
          ),
        ),
      ],
    );
  }
}
