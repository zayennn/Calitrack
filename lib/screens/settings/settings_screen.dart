import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary,
                      child: Text('E',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Elang',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('elang@example.com',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Preferences section
            Text('Preferensi',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text('Dark Mode',
                        style: TextStyle(color: Colors.white)),
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColors.primary,
                    secondary: Icon(Icons.dark_mode, color: Colors.white),
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  SwitchListTile(
                    title: Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColors.primary,
                    secondary: Icon(Icons.notifications, color: Colors.white),
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: Icon(Icons.language, color: Colors.white),
                    title: Text('Bahasa', style: TextStyle(color: Colors.white)),
                    trailing: Text('Indonesia', style: TextStyle(color: Colors.grey)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: Icon(Icons.alarm, color: Colors.white),
                    title: Text('Jam Reminder', style: TextStyle(color: Colors.white)),
                    trailing: Text('07:00', style: TextStyle(color: Colors.grey)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Data section
            Text('Data',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.backup, color: Colors.white),
                    title: Text('Backup', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: Icon(Icons.restore, color: Colors.white),
                    title: Text('Restore', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: Icon(Icons.picture_as_pdf, color: Colors.white),
                    title: Text('Export PDF', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // About
            Card(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white),
                title: Text('Tentang Aplikasi', style: TextStyle(color: Colors.white)),
                subtitle: Text('Versi 1.0.0', style: TextStyle(color: Colors.grey)),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
            // Logout button (not needed but we can add placeholder)
            // "Logout tidak perlu." So we skip.
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}