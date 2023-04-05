import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scheduled_service/views/testt.dart';

import 'views/ScheduleServiceScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedule Service',
      home: Testt()
      // ScheduleServiceScreen(),
    );
  }
}