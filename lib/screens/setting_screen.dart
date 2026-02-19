import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          settingsTile(
            icon: Icons.language,
            title: "Language",
            onTap: () {},
          ),

          settingsTile(
            icon: Icons.notifications_none,
            title: "Notification",
            onTap: () {},
          ),

          settingsTile(
            icon: Icons.description_outlined,
            title: "Terms of Use",
            onTap: () {},
          ),

          settingsTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () {},
          ),

          settingsTile(
            icon: Icons.send_outlined,
            title: "Chat support",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget settingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(icon, color: Colors.grey.shade600),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff33302E)
            ),
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ),
      ],
    );
  }
}
