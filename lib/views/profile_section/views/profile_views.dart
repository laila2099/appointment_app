import 'package:flutter/material.dart';

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
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      bottomNavigationBar: const CustomBottomBar(),
      body: Stack(
        
        children: [
          // Top blue background
          Container(
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0xFF3A82F7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Icon(Icons.settings, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 140, bottom: 100),
              child: Column(
                children: [
                  // Avatar
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.pinkAccent,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.edit, size: 16, color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
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
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              alignment: Alignment.center,
                              child: const Text(
                                'My Appointment',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              alignment: Alignment.center,
                              child: Text(
                                'Medical records',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // List Options
                  const ProfileTile(
                    icon: Icons.person_outline,
                    title: "Personal Information",
                    bgColor: Color(0xFFD8E7FE),
                  ),
                  const ProfileTile(
                    icon: Icons.medical_services_outlined,
                    title: "My Test & Diagnostic",
                    bgColor: Color(0xFFDCF4E7),
                  ),
                  const ProfileTile(
                    icon: Icons.payment_outlined,
                    title: "Payment",
                    bgColor: Color(0xFFFEE1E1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color bgColor;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.bgColor,
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
            child: Icon(icon, color: Colors.black),
          ),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFFF3EDF7),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home_outlined),
          Icon(Icons.chat_outlined),
          Icon(Icons.calendar_month_outlined),
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xFFDCCBFA),
          )
        ],
      ),
    );
  }
}
