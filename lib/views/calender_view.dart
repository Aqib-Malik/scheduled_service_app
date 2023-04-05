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














// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/classes/event_list.dart';
// import 'package:intl/intl.dart';

// class ScheduledServicesScreen extends StatefulWidget {
//   final List<DateTime> scheduledServices;
//   final DateTime selectedMonth;

//   ScheduledServicesScreen({
//     required this.scheduledServices,
//     required this.selectedMonth,
//   });

//   @override
//   State<ScheduledServicesScreen> createState() => _ScheduledServicesScreenState();
// }

// class _ScheduledServicesScreenState extends State<ScheduledServicesScreen> {
//     static Widget _eventIcon = new Container(
//     decoration: new BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(1000)),
//         border: Border.all(color: Colors.blue, width: 2.0)),
//     child: new Icon(
//       Icons.person,
//       color: Colors.amber,
//     ),
//   );
//     EventList<Event> markedDates = new EventList<Event>(
//     events: {
//       new DateTime(2023, 4, 13): [
//         // new Event(
//         //   date: new DateTime(2023, 2, 13),
//         //   title: 'Event 1',
//         //   icon: _eventIcon,
//         //   dot: Container(
//         //     margin: EdgeInsets.symmetric(horizontal: 1.0),
//         //     color: Colors.red,
//         //     height: 5.0,
//         //     width: 5.0,
//         //   ),
//         // ),
//         // new Event(
//         //   date: new DateTime(2023, 2, 16),
//         //   title: 'Event 2',
//         //   icon: _eventIcon,
//         // ),
//         // new Event(
//         //   date: new DateTime(2023, 2, 18),
//         //   title: 'Event 3',
//         //   icon: _eventIcon,
//         // ),
//       ],
//     },
//   );


//   setScheduled(){
//     this.widget.scheduledServices.forEach((element) { 
//        new Event(
//           date: this.widget.selectedMonth
// ,
//           title: 'Event 1',
//           icon: _eventIcon,
//           dot: Container(
//             margin: EdgeInsets.symmetric(horizontal: 1.0),
//             color: Colors.red,
//             height: 5.0,
//             width: 5.0,
//           )
//           );
//     });
//   }
  
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setScheduled();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Create a list of Event objects from the scheduled services
//     // EventList<Event> markedDates = EventList<Event>(
//     //   events: widget.scheduledServices.map((date) {
//     //     return Event(
//     //       date: date,
//     //       icon: Icon(Icons.calendar_today, color: Colors.white, size: 16),
//     //     );
//     //   }).toList(),
//     // );

    

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Scheduled Services',
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blue[800],
//         elevation: 0,
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: CalendarCarousel<Event>(
//           // Configure the calendar carousel
//           markedDatesMap: markedDates,
//           selectedDateTime: widget.selectedMonth,
//           onDayPressed: (date, events) {
//             // Handle day pressed event
//             print('Selected date: $date');
//           },
        
//           thisMonthDayBorderColor: Colors.grey,
//           headerText: DateFormat.yMMM().format(widget.selectedMonth),
//           headerTextStyle: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue[800],
//           ),
//           daysTextStyle: TextStyle(
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.bold,
//             color: Colors.grey[800],
//             fontSize: 18,
//           ),
//           weekendTextStyle: TextStyle(
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.bold,
//             color: Colors.red[800],
//             fontSize: 18,
//           ),
//           todayTextStyle: TextStyle(
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.bold,
//             color: Colors.blue[800],
//             fontSize: 18,
//           ),
//           selectedDayButtonColor: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
