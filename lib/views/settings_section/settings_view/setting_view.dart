import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Setting',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _settingItem(
            icon: Icons.notifications_none,
            title: 'Notification',
            onTap: () {},
          ),
          _divider(),
          _settingItem(
            icon: Icons.help_outline,
            title: 'FAQ',
            onTap: () {},
          ),
          _divider(),
          _settingItem(
            icon: Icons.lock_outline,
            title: 'Security',
            onTap: () {},
          ),
          _divider(),
          _settingItem(
            icon: Icons.language,
            title: 'Language',
            onTap: () {},
          ),
          _divider(),
          _settingItem(
            icon: Icons.logout,
            title: 'Logout',
            color: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _settingItem({
    required IconData icon,
    required String title,
    Color color = Colors.black,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 0.5,
      indent: 20,
      endIndent: 20,
    );
  }
}
