import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

// screens
import 'screens/home/home_screen.dart';


void main() {
  runApp(const CaliTrackApp());
}

class CaliTrackApp extends StatelessWidget {
  const CaliTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaliTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}