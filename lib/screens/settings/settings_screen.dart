import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary,
                      child: const Text('E',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    const SizedBox(width: 16),
                    const Column(
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
            const Text('Preferensi',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title:
                        const Text('Dark Mode', style: TextStyle(color: Colors.white)),
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColors.primary,
                    secondary: const Icon(Icons.dark_mode_rounded, color: Colors.white),
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  SwitchListTile(
                    title: const Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColors.primary,
                    secondary: const Icon(Icons.notifications_rounded, color: Colors.white),
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: const Icon(Icons.language_rounded, color: Colors.white),
                    title: const Text('Bahasa', style: TextStyle(color: Colors.white)),
                    trailing: const Text('Indonesia', style: TextStyle(color: Colors.grey)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: const Icon(Icons.alarm_rounded, color: Colors.white),
                    title: const Text('Jam Reminder', style: TextStyle(color: Colors.white)),
                    trailing: const Text('07:00', style: TextStyle(color: Colors.grey)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Data',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.backup_rounded, color: Colors.white),
                    title: const Text('Backup', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: const Icon(Icons.restore_rounded, color: Colors.white),
                    title: const Text('Restore', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  Divider(color: Colors.grey.shade700, height: 1),
                  ListTile(
                    leading: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white),
                    title: const Text('Export PDF', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_rounded, color: Colors.white),
                title: const Text('Tentang Aplikasi', style: TextStyle(color: Colors.white)),
                subtitle: const Text('Versi 1.0.0', style: TextStyle(color: Colors.grey)),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}