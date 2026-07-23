import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../models/workout.dart';
import '../../data/dummy_data.dart';
import '../../widgets/exercise_card.dart';
import '../../widgets/custom_button.dart';
import 'workout_detail_screen.dart';

class WorkoutScreen extends StatelessWidget {
  final Workout? workout;

  const WorkoutScreen({super.key, this.workout});

  @override
  Widget build(BuildContext context) {
    final w = workout ?? DummyData.weeklyWorkouts[DateTime.now().weekday - 1];
    return Scaffold(
      appBar: AppBar(title: Text(w.name)),
      body: w.isRestDay
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bedtime_rounded, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Hari ini istirahat',
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.grey.shade800,
                  color: AppColors.primary,
                  minHeight: 4,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.padding),
                    itemCount: w.exercises.length + 1,
                    itemBuilder: (context, index) {
                      if (index == w.exercises.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomButton(
                            text: 'Selesaikan Workout',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Workout selesai!'),
                                  backgroundColor: AppColors.primary,
                                ),
                              );
                            },
                          ),
                        );
                      }
                      final exercise = w.exercises[index];
                      return ExerciseCard(
                        exercise: exercise,
                        isCompleted: index == 0,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  WorkoutDetailScreen(exercise: exercise),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}