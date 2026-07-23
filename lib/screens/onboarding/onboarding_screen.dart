import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../widgets/custom_button.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPageData> pages = [
    OnboardingPageData(
      title: 'Selamat Datang di CaliTrack',
      description: 'Aplikasi untuk membangun disiplin latihan calisthenics setiap hari.',
      icon: Icons.fitness_center,
      color: AppColors.primary,
    ),
    OnboardingPageData(
      title: 'Bangun Kebiasaan',
      description: 'Lacak progress latihanmu dan tetap konsisten dengan jadwal mingguan.',
      icon: Icons.checklist,
      color: AppColors.secondary,
    ),
    OnboardingPageData(
      title: 'Jadi Lebih Kuat',
      description: 'Tingkatkan kekuatan dan stamina dengan program latihan yang terstruktur.',
      icon: Icons.trending_up,
      color: AppColors.primary,
    ),
  ];

  void _goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _goToHome,
                  child: const Text('Lewati', style: TextStyle(color: Colors.grey)),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(pages[index]);
                  },
                ),
              ),
              // Dots indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? AppColors.primary : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Buttons
              Row(
                children: [
                  if (_currentPage < pages.length - 1) ...[
                    Expanded(
                      child: CustomButton(
                        text: 'Lewati',
                        onPressed: _goToHome,
                        backgroundColor: Colors.transparent,
                        textColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        text: 'Lanjut',
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: CustomButton(
                        text: 'Mulai',
                        onPressed: _goToHome,
                        icon: Icons.arrow_forward,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPageData data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: data.color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(data.icon, size: 60, color: data.color),
        ),
        const SizedBox(height: 48),
        Text(
          data.title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          data.description,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}