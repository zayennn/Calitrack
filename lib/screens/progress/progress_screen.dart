// File: lib/screens/progress/progress_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../data/dummy_data.dart';
import '../../widgets/stat_card.dart';
import 'weight_tracker_screen.dart';
import '../statistics/statistics_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Workout Mingguan',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 7,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                              return Text(days[value.toInt() % 7],
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12));
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      barGroups: [
                        _makeBarGroup(0, 5),
                        _makeBarGroup(1, 6),
                        _makeBarGroup(2, 4),
                        _makeBarGroup(3, 0),
                        _makeBarGroup(4, 7),
                        _makeBarGroup(5, 6),
                        _makeBarGroup(6, 2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WeightTrackerScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Berat Badan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Icon(Icons.chevron_right_rounded, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: _getWeightSpots(),
                          isCurved: true,
                          color: AppColors.secondary,
                          barWidth: 3,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.secondary.withOpacity(0.1),
                          ),
                        ),
                      ],
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      minY: 45,
                      maxY: 55,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Statistik',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                StatCard(
                    icon: Icons.fitness_center_rounded,
                    label: 'Total Workout',
                    value: '${DummyData.totalWorkoutsCompleted}'),
                StatCard(
                    icon: Icons.star_rounded,
                    label: 'Streak',
                    value: '${DummyData.workoutStreak}',
                    iconColor: Colors.orange),
                StatCard(
                    icon: Icons.calendar_today_rounded,
                    label: 'Hari Aktif',
                    value: '${DummyData.activeDays}',
                    iconColor: AppColors.secondary),
                StatCard(
                    icon: Icons.pie_chart_rounded,
                    label: 'Konsistensi',
                    value: '${DummyData.consistencyPercent}%',
                    iconColor: Colors.purpleAccent),
                StatCard(
                    icon: Icons.timer_rounded,
                    label: 'Rata-rata',
                    value: '${DummyData.avgWorkoutDuration}m',
                    iconColor: Colors.teal),
                StatCard(
                    icon: Icons.hourglass_bottom_rounded,
                    label: 'Total Waktu',
                    value:
                        '${(DummyData.totalWorkoutTime / 60).toStringAsFixed(1)}j',
                    iconColor: Colors.deepOrange),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const StatisticsScreen()));
                },
                icon: Icon(Icons.analytics_rounded, color: AppColors.primary),
                label: Text('Lihat Statistik Lengkap',
                    style: TextStyle(color: AppColors.primary)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y == 0 ? Colors.grey : AppColors.primary,
          width: 12,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  List<FlSpot> _getWeightSpots() {
    final history = DummyData.getWeightHistory();
    return history
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.weight))
        .toList();
  }
}