import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
      title: 'Profile UI',

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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
    
        iconTheme: IconThemeData(color: Colors.white),
    
        backgroundColor: AppColors.primary,
    
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Top blue background
          Container(
            height: MediaQuery.of(context).size.height,
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
            height: MediaQuery.of(context).size.height,),
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
                          radius: 52,
                          backgroundColor: Colors.white,
                          child: const CircleAvatar(
                            radius: 48,
                            
                            
                            
                            backgroundColor: Colors.pinkAccent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
    
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
                                color: Colors.white,
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
                  ProfileTile(
                    iconPath: AppIcons.personalCard,
                    
                    iconColor: Colors.blue,
                    title: "Personal Information",
                    bgColor: const Color(0xFFD8E7FE),
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
              colorFilter: ColorFilter.mode(
                 iconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: Text(title),
        
        ),
        
      ),
    );
  }
}
