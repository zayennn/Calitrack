import 'exercise.dart';

class Workout {
  final String id;
  final String day;
  final String name;
  final List<Exercise> exercises;
  final int estimatedMinutes;
  final bool isRestDay;

  Workout({
    required this.id,
    required this.day,
    required this.name,
    required this.exercises,
    required this.estimatedMinutes,
    this.isRestDay = false,
  });

  int get totalExercises => exercises.length;
}