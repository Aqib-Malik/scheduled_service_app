import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduledServicesScreen extends StatelessWidget {
  final List<DateTime> scheduledServices;
  final DateTime selectedMonth;

  ScheduledServicesScreen({
    required this.scheduledServices,
    required this.selectedMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scheduled Services',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: _getNumberOfDaysInMonth(selectedMonth),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final date = DateTime(selectedMonth.year, selectedMonth.month, index + 1);
            final isToday = date.isToday();
            final hasService = scheduledServices.any((service) => service.isSameDay(date));
            return Container(
              decoration: BoxDecoration(
                color: isToday ? Colors.blue.withOpacity(0.3) : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: isToday ? Colors.blue[800] : Colors.grey[800],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  if (hasService)
                    Container(
                      width: 24,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[400],
                      ),
                      child: FittedBox(
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  int _getNumberOfDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }
}

extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }

  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year && this.month == now.month && this.day == now.day;
  }
}













