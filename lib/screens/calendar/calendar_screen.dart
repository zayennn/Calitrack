import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../data/dummy_data.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _currentMonth;
  late List<DateTime> _workoutDates;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
    _workoutDates = DummyData.getWorkoutDates();
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDayOfWeek = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday % 7; // Sunday=0
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('MMMM yyyy').format(_currentMonth)),
        actions: [
          IconButton(onPressed: _previousMonth, icon: const Icon(Icons.chevron_left)),
          IconButton(onPressed: _nextMonth, icon: const Icon(Icons.chevron_right)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            // Day headers
            Row(
              children: ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab']
                  .map((d) => Expanded(
                        child: Center(
                          child: Text(d,
                              style: const TextStyle(
                                  color: Colors.grey, fontWeight: FontWeight.bold)),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            // Calendar grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 7,
                children: List.generate(firstDayOfWeek, (index) => const SizedBox()),
              )
            ),
            // Build days
            ...List.generate(daysInMonth, (index) {
              final day = index + 1;
              final date = DateTime(_currentMonth.year, _currentMonth.month, day);
              final isWorkout = _workoutDates.any((d) => d.day == day && d.month == date.month && d.year == date.year);
              final isToday = today.day == day && today.month == date.month && today.year == date.year;

              return GestureDetector(
                onTap: () {
                  // show activity for that day
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isWorkout ? AppColors.primary : Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(8),
                    border: isToday ? Border.all(color: AppColors.secondary, width: 2) : null,
                  ),
                  child: Center(
                    child: Text('$day',
                        style: TextStyle(
                          color: isWorkout ? Colors.black : Colors.white,
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        )),
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            // Activity for selected day (dummy)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aktivitas Hari Ini',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    Text('Push Day - 5 latihan selesai',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}