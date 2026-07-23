// File: lib/screens/workout/workout_detail_screen.dart
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../models/exercise.dart';
import '../../widgets/custom_button.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final Exercise exercise;

  const WorkoutDetailScreen({super.key, required this.exercise});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  late List<bool> setCompleted;

  @override
  void initState() {
    super.initState();
    setCompleted =
        List.generate(widget.exercise.targetSets, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Scaffold(
      appBar: AppBar(title: Text(ex.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              ),
              child:
                  const Center(child: Icon(Icons.image_rounded, size: 60, color: Colors.grey)),
            ),
            const SizedBox(height: 16),
            Text(ex.name,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Text(ex.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildInfoChip('${ex.targetSets} Set', Icons.repeat_rounded),
                const SizedBox(width: 12),
                _buildInfoChip(
                    '${ex.targetReps} Reps', Icons.format_list_numbered_rounded),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Checklist Set',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            ...List.generate(ex.targetSets, (index) {
              return CheckboxListTile(
                value: setCompleted[index],
                onChanged: (val) {
                  setState(() {
                    setCompleted[index] = val ?? false;
                  });
                },
                title: Text('Set ${index + 1}',
                    style: const TextStyle(color: Colors.white)),
                activeColor: AppColors.primary,
                checkColor: Colors.black,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: AppColors.card,
              );
            }),
            if (ex.tips.isNotEmpty) ...[
              const SizedBox(height: 24),
              const Text('Tips',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ex.tips
                        .map((tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: [
                                  const Icon(Icons.lightbulb_rounded,
                                      color: AppColors.secondary, size: 18),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(tip,
                                          style: const TextStyle(
                                              color: Colors.white70))),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),
            CustomButton(
              text: 'Selesai',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}