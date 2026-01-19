import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:appointment_app/core/constant/app_images.dart';
import 'package:appointment_app/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/services/image_picker_service.dart';
import '../../../../widgets/general_widgets/pick_image_sheet.dart';
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
              Obx(() {
                final file = controller.avatarFile.value;
                return CircleAvatar(
                  radius: 60.r,
                  backgroundImage: file != null
                      ? FileImage(file)
                      : AssetImage(AppImages.avatar) as ImageProvider,
                );
              }),
              GestureDetector(
                onTap: () async {
                  final src = await PickImageSheet.show();
                  if (src == null) return;

                  final picker = Get.find<ImagePickerService>();
                  final file =
                      await picker.pickImageFile(source: src, imageQuality: 85);

                  if (file == null) return;

                  controller.avatarFile.value = file;
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF8F8F8),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.edit,
                    width: 16.w,
                    height: 16.w,
                    color: AppColors.primary,
                  ),
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
