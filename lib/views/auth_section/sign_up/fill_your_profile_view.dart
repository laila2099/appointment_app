import 'package:flutter/material.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../widgets/helpful_widgets/primary_button_widget.dart';
import '../../../widgets/helpful_widgets/text_field_widget.dart';
import '../widgets/phone_field_widget.dart';

class FillYourProfileView extends StatelessWidget {
  const FillYourProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    // Title
                    Text(
                      "Fill Your Profile",
                      style: CustomTextStyles.headline32Bold,
                    ),
                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      "Please take a few minutes to fill out your profile with as much detail as possible.",
                      style: CustomTextStyles.subtitle,
                    ),
                    const SizedBox(height: 32),

                    /// Profile Image
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightGrey,
                              image: const DecorationImage(
                                image: AssetImage(AppImages.personPhoto),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.textField,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email
                    CustomTextField(
                      hint: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    // Password
                    const CustomTextField(
                      hint: "Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),

                    // Birthday
                    const CustomTextField(
                      hint: "Birthday",
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    PhoneFieldWidget(
                      initialCountryCode: 'SA',
                      onChanged: (value) {},
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // الزر ثابت أسفل الشاشة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: CustomPrimaryButton(
                  label: "Submit",
                  onTap: () {
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
