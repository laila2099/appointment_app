import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool docNow = true;
  bool sound = true;
  bool vibrate = true;
  bool appUpdates = false;
  bool specialOffers = true;

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
          'Notification',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _switchTile(
            title: 'Notification from DocNow',
            value: docNow,
            onChanged: (val) => setState(() => docNow = val),
          ),
          _divider(),
          _switchTile(
            title: 'Sound',
            value: sound,
            onChanged: (val) => setState(() => sound = val),
          ),
          _divider(),
          _switchTile(
            title: 'Vibrate',
            value: vibrate,
            onChanged: (val) => setState(() => vibrate = val),
          ),
          _divider(),
          _switchTile(
            title: 'App Updates',
            value: appUpdates,
            onChanged: (val) => setState(() => appUpdates = val),
          ),
          _divider(),
          _switchTile(
            title: 'Special Offers',
            value: specialOffers,
            onChanged: (val) => setState(() => specialOffers = val),
          ),
        ],
      ),
    );
  }

  Widget _switchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Colors.grey.shade300,
          ),
        ],
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
