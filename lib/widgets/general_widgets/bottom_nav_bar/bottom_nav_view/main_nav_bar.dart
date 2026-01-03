import 'package:appointment_app/views/home_section/home_screen/view/home_screen.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../views/my_apponiment_section/my_appoitment_view/my_appoitment_view.dart';
import '../../../../views/profile_section/profile_view/profile_view.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final NavigationController navCtrl = Get.put(NavigationController());

  final List<Widget> _screens = [
    HomeScreen(),
    const Center(child: Text("Chat")),
    const Center(child: Text("Search")),
    const AppoitmentView(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(index: navCtrl.selectedIndex, children: _screens),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: CustomBottomNavBar(),
        ),
      ),
    );
  }
}
