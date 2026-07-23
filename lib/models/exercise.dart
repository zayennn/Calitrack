class Exercise {
  final String id;
  final String name;
  final String description;
  final int targetSets;
  final int targetReps;
  final String imagePlaceholder;
  final List<String> tips;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.targetSets,
    required this.targetReps,
    this.imagePlaceholder = 'assets/exercise_placeholder.png',
    this.tips = const [],
  });
}