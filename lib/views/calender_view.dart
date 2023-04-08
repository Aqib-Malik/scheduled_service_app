import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduledServicesScreen extends StatefulWidget {
  final List<DateTime> scheduledServices;
    DateTime selectedMonth;

  ScheduledServicesScreen({
    required this.scheduledServices,
    required this.selectedMonth,
  });

  @override
  State<ScheduledServicesScreen> createState() =>
      _ScheduledServicesScreenState();
}

class _ScheduledServicesScreenState extends State<ScheduledServicesScreen> {
//   void _handleForwardButtonPressed() {
//   setState(() {
//     if (selectedMonth.month == 12) {
//       selectedMonth = DateTime(selectedMonth.year + 1, 1);
//     } else {
//       selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
//     }
//   });
// }
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){
                       setState(() {
      widget.selectedMonth = DateTime(
        widget.selectedMonth.year,
        widget.selectedMonth.month - 1,
      );
    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                Text(
                  DateFormat.MMMM().format(  this.widget.selectedMonth),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                    onTap: () {
    setState(() {
      widget.selectedMonth = DateTime(
        widget.selectedMonth.year,
        widget.selectedMonth.month + 1,
      );
    });
  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 400,
            width: 500,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: _getNumberOfDaysInMonth(widget.selectedMonth),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final date = DateTime(widget.selectedMonth.year,
                    widget.selectedMonth.month, index + 1);
                final isToday = date.isToday();
                final hasService = widget.scheduledServices
                    .any((service) => service.isSameDay(date));
                return Container(
                  decoration: BoxDecoration(
                    color:
                        isToday ? Colors.green.withOpacity(0.3) : Colors.white,
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
                          color: isToday ? Colors.green[800] : Colors.grey[800],
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
                              Icons.circle,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                        ),
                      if ((index + 1) % 2 == 0)
                        Container(
                          width: 24,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red[400],
                          ),
                          child: FittedBox(
                            child: Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                        ),
                      if ((index + 1) % 2 != 0)
                        Container(
                          width: 24,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange[400],
                          ),
                          child: FittedBox(
                            child: Icon(
                              Icons.circle,
                              color: Colors.orange,
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
        ],
      ),
    );
  }

  int _getNumberOfDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }
}

extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year &&
        this.month == now.month &&
        this.day == now.day;
  }
}