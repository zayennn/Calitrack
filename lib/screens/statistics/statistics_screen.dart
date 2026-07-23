// File: lib/screens/statistics/statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../data/dummy_data.dart';
import '../../widgets/stat_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistik Lengkap')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Workout',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Total',
                        DummyData.totalWorkoutsCompleted.toString(), Icons.done_all_rounded),
                    _buildStatItem('Bulan Ini', '12', Icons.calendar_view_month_rounded),
                    _buildStatItem('Minggu Ini', '5', Icons.date_range_rounded),
                    _buildStatItem('Hari Ini', '1', Icons.today_rounded),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Distribusi Latihan',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 2,
                            centerSpaceRadius: 40,
                            sections: [
                              PieChartSectionData(
                                color: AppColors.primary,
                                value: 40,
                                title: 'Push',
                                titleStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                radius: 50,
                              ),
                              PieChartSectionData(
                                color: AppColors.secondary,
                                value: 30,
                                title: 'Pull',
                                titleStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                radius: 50,
                              ),
                              PieChartSectionData(
                                color: Colors.orange,
                                value: 20,
                                title: 'Leg',
                                titleStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                radius: 50,
                              ),
                              PieChartSectionData(
                                color: Colors.purple,
                                value: 10,
                                title: 'Other',
                                titleStyle: const TextStyle(
                                    fontSize: 10, color: Colors.black),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 20,
                            barGroups: [
                              _makeGroup(0, 12, 'Push', AppColors.primary),
                              _makeGroup(1, 8, 'Pull', AppColors.secondary),
                              _makeGroup(2, 6, 'Leg', Colors.orange),
                              _makeGroup(3, 3, 'Other', Colors.purple),
                            ],
                            titlesData: FlTitlesData(show: false),
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                      icon: Icons.timer_rounded,
                      label: 'Rata-rata/hari',
                      value: '${DummyData.avgWorkoutDuration}m'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                      icon: Icons.hourglass_full_rounded,
                      label: 'Total Waktu',
                      value:
                          '${(DummyData.totalWorkoutTime / 60).toStringAsFixed(1)}j'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 28),
        const SizedBox(height: 8),
        Text(value,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  BarChartGroupData _makeGroup(int x, double y, String label, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 12,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
      showingTooltipIndicators: [],
    );
  }
}