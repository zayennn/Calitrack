// File: lib/screens/home/home_content.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../data/dummy_data.dart';
import '../../widgets/progress_ring.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/day_card.dart';
import '../../widgets/custom_button.dart';
import '../workout/workout_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Selamat pagi';
    if (hour < 17) return 'Selamat siang';
    return 'Selamat malam';
  }

  @override
  Widget build(BuildContext context) {
    final todayIndex = DateTime.now().weekday - 1;
    final todayWorkout = DummyData.weeklyWorkouts[todayIndex];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Halo, Elang 👋',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(_getGreeting(),
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.padding),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary,
              child: const Text('E',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.padding),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Workout Hari Ini',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 8),
                          if (todayWorkout.isRestDay)
                            const Text('Rest Day',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey))
                          else ...[
                            Text(todayWorkout.name,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary)),
                            const SizedBox(height: 4),
                            Text(
                                '${todayWorkout.totalExercises} Latihan · ${todayWorkout.estimatedMinutes} Menit',
                                style:
                                    const TextStyle(color: Colors.grey)),
                          ],
                          const SizedBox(height: 16),
                          CustomButton(
                            text: todayWorkout.isRestDay
                                ? 'Istirahat'
                                : 'Mulai Latihan',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      WorkoutScreen(workout: todayWorkout),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    if (!todayWorkout.isRestDay)
                      const ProgressRing(
                        progress: 0.4,
                        size: 100,
                        strokeWidth: 8,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Jadwal Minggu Ini',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    List.generate(DummyData.weeklyWorkouts.length, (index) {
                  final w = DummyData.weeklyWorkouts[index];
                  return DayCard(
                    workout: w,
                    isToday: index == todayIndex,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => WorkoutScreen(workout: w),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Quick Stats',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.check_circle_rounded,
                    label: 'Workout Selesai',
                    value: '${DummyData.totalWorkoutsCompleted}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.local_fire_department_rounded,
                    label: 'Streak',
                    value: '${DummyData.workoutStreak} hari',
                    iconColor: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    icon: Icons.monitor_weight_rounded,
                    label: 'Berat Badan',
                    value: '${DummyData.currentWeight} kg',
                    iconColor: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}