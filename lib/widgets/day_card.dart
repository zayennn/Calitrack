import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../core/constants/colors.dart';

class DayCard extends StatelessWidget {
  final Workout workout;
  final bool isToday;
  final VoidCallback? onTap;

  const DayCard({
    super.key,
    required this.workout,
    this.isToday = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: workout.isRestDay ? Colors.grey.shade800 : AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border:
              isToday ? Border.all(color: AppColors.secondary, width: 2) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(workout.day.substring(0, 3).toUpperCase(),
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              workout.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: workout.isRestDay ? Colors.grey : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
