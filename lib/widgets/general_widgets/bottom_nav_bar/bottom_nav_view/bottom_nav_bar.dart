// import 'package:appoitment_app/core/constant/app_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class NavigationController extends GetxController {
//   var selectedIndex = 0.obs;

//   void changeIndex(int index) {
//     selectedIndex.value = index;
//   }
// }

// class MainLayout extends StatelessWidget {
//   MainLayout({super.key});

//   final NavigationController navCtrl = Get.put(NavigationController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,

//       body: Obx(() => _buildBody(navCtrl.selectedIndex.value)),

// bottomNavigationBar: SafeArea(
//   top: false,
//   child: Padding(
//     padding: const EdgeInsets.only(bottom: 15),
//           child: _buildCustomBottomNavBar(),
//         ),
//       ),
//     );
//   }

//   Widget _buildBody(int index) {
//     switch (index) {
//       case 0:
//         return const Center(child: Text("Home"));
//       case 1:
//         return const Center(child: Text("Chat"));
//       case 2:
//         return const Center(child: Text("Search"));
//       case 3:
//         return const AppointmentPageContent();
//       case 4:
//         return const Center(child: Text("Profile"));
//       default:
//         return const AppointmentPageContent();
//     }
//   }

//   Widget _buildCustomBottomNavBar() {
//     return SizedBox(
//       height: 110.h,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             height: 80.h,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                   offset: const Offset(0, -5),
//                 ),
//               ],
//             ),
//           ),

//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             height: 90.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildNavItemSvg(AppIcons.home, 0),
//                 _buildNavItemSvg(AppIcons.chat, 1),

//                 SizedBox(width: 60.w),

//                 _buildNavItemSvg(AppIcons.calendar, 3),

//                 _buildProfileItem(4),
//               ],
//             ),
//           ),

//           Positioned(
//             bottom: 20.h,
//             child: GestureDetector(
//               onTap: () => navCtrl.changeIndex(2),
//               child: Container(
//                 height: 80.h,
//                 width: 80.w,
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(28.r), // 👈 بدل circle
//                 ),
//                 child: Container(
//                   height: 72.h,
//                   width: 72.w,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF3B7CFF),
//                     borderRadius: BorderRadius.circular(28.r), // 👈 radius 28
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(
//                       AppIcons.search,
//                       width: 24.sp,
//                       height: 24.sp,
//                       colorFilter: const ColorFilter.mode(
//                         Colors.white,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItemSvg(String svgPath, int index) {
//     return Obx(() {
//       bool isActive = navCtrl.selectedIndex.value == index;

//       return GestureDetector(
//         onTap: () => navCtrl.changeIndex(index),
//         behavior: HitTestBehavior.opaque,
//         child: SizedBox(
//           height: 70.h,
//           width: 60.w,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               SvgPicture.asset(
//                 svgPath,
//                 width: 24.w,
//                 height: 24.h,
//                 colorFilter: ColorFilter.mode(
//                   isActive ? const Color(0xFF3B7CFF) : const Color(0xFF242424),
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   Widget _buildProfileItem(int index) {
//     return Obx(() {
//       bool isActive = navCtrl.selectedIndex.value == index;
//       return GestureDetector(
//         onTap: () => navCtrl.changeIndex(index),
//         child: Container(
//           padding: const EdgeInsets.all(2),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//               color: isActive ? const Color(0xFF3B7CFF) : Colors.transparent,
//               width: 2,
//             ),
//           ),
//           child: const CircleAvatar(
//             radius: 14,
//             backgroundImage: NetworkImage(
//               "https://i.pravatar.cc/150?u=user_profile",
//             ),
//             backgroundColor: Colors.grey,
//           ),
//         ),
//       );
//     });
//   }
// }

// class AppointmentPageContent extends StatelessWidget {
//   const AppointmentPageContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
//       children: [
//         const Text(
//           "My Appointment",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         Container(
//           height: 150.h,
//           color: Colors.white,
//           child: const Center(child: Text("Appointment List Here...")),
//         ),
//       ],
//     );
//   }
// }
import 'package:appoitment_app/core/constant/app_colors.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/bottom_nav_icon.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/floating_bottom.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/bottom_nav_view/profile_nav_icon.dart';
import 'package:appoitment_app/widgets/general_widgets/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:appoitment_app/core/constant/app_icons.dart';

class CustomBottomNavBar extends GetView<NavigationController> {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(iconPath: AppIcons.home, index: 0),
                NavBarIcon(iconPath: AppIcons.chat, index: 1, hasBadge: true),
                SizedBox(width: 60.w),
                NavBarIcon(iconPath: AppIcons.calendar, index: 3),
                const ProfileNavIcon(index: 4),
              ],
            ),
          ),

          Positioned(bottom: 25.h, child: const FloatingSearchButton()),
        ],
      ),
    );
  }
}
