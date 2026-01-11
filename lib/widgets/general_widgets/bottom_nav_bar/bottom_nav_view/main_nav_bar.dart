import 'package:appointment_app/views/home_section/home_screen/view/home_screen.dart';
import 'package:appointment_app/views/inbox_section/view/inbox_view.dart';
import 'package:appointment_app/views/my_apponiment_section/my_appoitment_view/my_appoitment_view.dart';
import 'package:appointment_app/views/profile_section/profile_view/profile_view.dart';
import 'package:appointment_app/views/search_section/controller/search_controller.dart';
import 'package:appointment_app/views/search_section/view/search_view.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_bar.dart';
import 'package:appointment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../login_required_gate.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final NavigationController navCtrl = Get.find();

  final List<Widget> _screens = [
    HomeScreen(),
    const InboxView(),
    const SearchView(),
    const AppointmentView(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SearchViewController>()) {
      Get.lazyPut<SearchViewController>(() => SearchViewController());
    }

    return Scaffold(
      extendBody: true,
      body: Obx(
        () {
          final index = navCtrl.selectedIndex;
          final isProtected = navCtrl.protectedTabs.contains(index);
          final loggedIn = navCtrl.isLoggedIn;
          final showGate = !loggedIn && isProtected;

          if (showGate) {
            return const LoginRequiredGate();
          }
          return IndexedStack(index: navCtrl.selectedIndex, children: _screens);
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
