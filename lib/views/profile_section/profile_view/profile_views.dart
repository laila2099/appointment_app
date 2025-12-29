import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/app_icons.dart';
import 'package:appoitment_app/core/constant/app_images.dart';
import 'package:appoitment_app/widgets/general_widgets/app_header/app_header.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final NavigationController navCtrl = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial', primarySwatch: Colors.blue),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),

      backgroundColor: AppColors.white,
      body: Column(
        children: [
          AppHeader(
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            center: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .8,
                decoration: const BoxDecoration(color: AppColors.primary),
              ),

              Container(
                margin: const EdgeInsets.only(top: 92),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),

                width: double.infinity,
                height: MediaQuery.of(context).size.height,
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 38, bottom: 100),
                child: Column(
                  children: [
                    // Avatar
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
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
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 243, 239, 239),
                            ),
                            child: const Icon(
                              Icons.mode_edit_rounded,
                              size: 24,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    Text(
                      "Omar Ahmed",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "omarahmed14@gmail.com",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 12),
                    // Tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F2F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F2F6),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'My Appointment',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Medical records',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // List Options
                    Divider(color: Colors.grey, thickness: 1),
                    InkWell(
                      onTap: () {
                        // Navigate to Personal Information page
                      },
                      focusColor: Colors.blue.withOpacity(0.2),
                      child: ProfileTile(
                        iconPath: AppIcons.personalCard,

                        iconColor: Colors.blue,
                        title: "Personal Information",
                        bgColor: const Color(0xFFD8E7FE),
                      ),
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 235, 230, 230),
                      thickness: 1,
                    ),
                    const ProfileTile(
                      iconPath: AppIcons.medicalRecord,
                      iconColor: Colors.green,
                      title: "My Test & Diagnostic",
                      bgColor: Color(0xFFDCF4E7),
                    ),
                    const ProfileTile(
                      iconPath: AppIcons.wallet,
                      iconColor: Colors.red,
                      title: "Payment",
                      bgColor: Color(0xFFFEE1E1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color bgColor;
  final Color iconColor;

  const ProfileTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: bgColor,
            child: SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
