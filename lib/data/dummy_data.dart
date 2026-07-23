import '../models/workout.dart';
import '../models/exercise.dart';
import '../models/weight.dart';
import 'package:intl/intl.dart';

class DummyData {
  static final List<Exercise> pushExercises = [
    Exercise(
      id: 'e1',
      name: 'Incline Push Up',
      description:
          'Latihan push up dengan tangan di atas permukaan lebih tinggi untuk menargetkan otot dada bagian bawah.',
      targetSets: 4,
      targetReps: 10,
      tips: [
        'Jaga punggung tetap lurus.',
        'Turun perlahan.',
        'Naik secara eksplosif.',
      ],
    ),
    Exercise(
      id: 'e2',
      name: 'Diamond Push Up',
      description:
          'Push up dengan tangan membentuk diamond, menargetkan triceps.',
      targetSets: 3,
      targetReps: 12,
      tips: [
        'Dekatkan siku ke tubuh.',
        'Fokus pada triceps.',
      ],
    ),
    Exercise(
      id: 'e3',
      name: 'Pike Push Up',
      description:
          'Push up dengan posisi pinggul diangkat, mensimulasikan handstand push up.',
      targetSets: 3,
      targetReps: 8,
      tips: [
        'Jaga kaki tetap lurus.',
        'Turunkan kepala di antara tangan.',
      ],
    ),
    Exercise(
      id: 'e4',
      name: 'Decline Push Up',
      description:
          'Push up dengan kaki ditinggikan, menargetkan dada bagian atas.',
      targetSets: 3,
      targetReps: 10,
      tips: [
        'Jaga core tight.',
        'Jangan membungkuk.',
      ],
    ),
    Exercise(
      id: 'e5',
      name: 'Archer Push Up',
      description:
          'Push up dengan satu tangan lurus ke samping, meningkatkan kekuatan unilateral.',
      targetSets: 3,
      targetReps: 6,
      tips: [
        'Perlahan, kontrol gerakan.',
        'Rasakan kontraksi dada.',
      ],
    ),
  ];

  static final List<Exercise> pullExercises = [
    Exercise(
      id: 'e6',
      name: 'Pull Up',
      description: 'Latihan menarik badan ke atas bar.',
      targetSets: 4,
      targetReps: 8,
      tips: ['Aktifkan scapula.', 'Jangan mengayun.'],
    ),
    Exercise(
      id: 'e7',
      name: 'Chin Up',
      description: 'Pull up dengan telapak tangan menghadap ke dalam.',
      targetSets: 3,
      targetReps: 10,
      tips: ['Fokus pada bicep.'],
    ),
    Exercise(
      id: 'e8',
      name: 'Australian Pull Up',
      description: 'Bodyweight row menggunakan bar rendah.',
      targetSets: 3,
      targetReps: 12,
      tips: ['Jaga tubuh lurus.'],
    ),
    Exercise(
      id: 'e9',
      name: 'Inverted Row',
      description: 'Variasi bodyweight row.',
      targetSets: 3,
      targetReps: 10,
      tips: ['Aktifkan otot punggung.'],
    ),
    Exercise(
      id: 'e10',
      name: 'Scapular Pull Up',
      description: 'Mengaktifkan otot punggung atas.',
      targetSets: 3,
      targetReps: 10,
      tips: ['Gerakan kecil.'],
    ),
  ];

  static final List<Exercise> legExercises = [
    Exercise(
      id: 'e11',
      name: 'Bodyweight Squat',
      description: 'Squat dasar.',
      targetSets: 4,
      targetReps: 15,
    ),
    Exercise(
      id: 'e12',
      name: 'Lunges',
      description: 'Lunges bergantian.',
      targetSets: 3,
      targetReps: 12,
    ),
    Exercise(
      id: 'e13',
      name: 'Pistol Squat',
      description: 'Squat satu kaki.',
      targetSets: 3,
      targetReps: 5,
    ),
    Exercise(
      id: 'e14',
      name: 'Glute Bridge',
      description: 'Mengaktifkan glute.',
      targetSets: 3,
      targetReps: 15,
    ),
  ];

  static final List<Exercise> upperExercises = [
    Exercise(
      id: 'e15',
      name: 'Dips',
      description: 'Bodyweight dips pada parallel bar.',
      targetSets: 3,
      targetReps: 10,
    ),
    Exercise(
      id: 'e16',
      name: 'Push Up',
      description: 'Standard push up.',
      targetSets: 3,
      targetReps: 12,
    ),
    Exercise(
      id: 'e17',
      name: 'Plank',
      description: 'Core exercise.',
      targetSets: 3,
      targetReps: 1,
    ),
  ];

  static final List<Exercise> fullBodyExercises = [
    Exercise(
      id: 'e18',
      name: 'Burpees',
      description: 'Full body cardio.',
      targetSets: 3,
      targetReps: 10,
    ),
    Exercise(
      id: 'e19',
      name: 'Mountain Climbers',
      description: 'Core + cardio.',
      targetSets: 3,
      targetReps: 20,
    ),
    Exercise(
      id: 'e20',
      name: 'Jump Squats',
      description: 'Legs explosive.',
      targetSets: 3,
      targetReps: 12,
    ),
  ];

  static final List<Workout> weeklyWorkouts = [
    Workout(
      id: 'w1',
      day: 'Senin',
      name: 'Push',
      exercises: pushExercises,
      estimatedMinutes: 40,
    ),
    Workout(
      id: 'w2',
      day: 'Selasa',
      name: 'Pull',
      exercises: pullExercises,
      estimatedMinutes: 45,
    ),
    Workout(
      id: 'w3',
      day: 'Rabu',
      name: 'Leg',
      exercises: legExercises,
      estimatedMinutes: 35,
    ),
    Workout(
      id: 'w4',
      day: 'Kamis',
      name: 'Rest',
      exercises: [],
      estimatedMinutes: 0,
      isRestDay: true,
    ),
    Workout(
      id: 'w5',
      day: 'Jumat',
      name: 'Upper',
      exercises: upperExercises,
      estimatedMinutes: 30,
    ),
    Workout(
      id: 'w6',
      day: 'Sabtu',
      name: 'Full Body',
      exercises: fullBodyExercises,
      estimatedMinutes: 50,
    ),
    Workout(
      id: 'w7',
      day: 'Minggu',
      name: 'Rest',
      exercises: [],
      estimatedMinutes: 0,
      isRestDay: true,
    ),
  ];

  static List<WeightEntry> getWeightHistory() {
    final List<WeightEntry> entries = [];
    final now = DateTime.now();
    double weight = 50.0;
    for (int i = 30; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      weight += ((i % 5 == 0) ? -0.5 : (i % 7 == 0 ? 0.3 : 0.1));
      weight = weight.clamp(47.0, 52.0);
      entries.add(WeightEntry(date: date, weight: double.parse(weight.toStringAsFixed(1))));
    }
    return entries;
  }

  static final int totalWorkoutsCompleted = 67;
  static final int workoutStreak = 5;
  static final double currentWeight = 48.0;
  static final int totalExercisesDone = 320;
  static final int activeDays = 28;
  static final double consistencyPercent = 85.0;
  static final double avgWorkoutDuration = 38.0;
  static final double totalWorkoutTime = 2520.0;

  static List<DateTime> getWorkoutDates() {
    final now = DateTime.now();
    final List<DateTime> dates = [];
    for (int i = 0; i < 30; i++) {
      if (i % 3 != 0) {
        dates.add(now.subtract(Duration(days: i)));
      }
    }
    return dates;
  }
}