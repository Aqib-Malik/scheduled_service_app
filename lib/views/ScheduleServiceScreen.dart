import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scheduled_service/views/calender_view.dart';

class ScheduleServiceScreen extends StatefulWidget {
  @override
  _ScheduleServiceScreenState createState() => _ScheduleServiceScreenState();
}

class _ScheduleServiceScreenState extends State<ScheduleServiceScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _scheduledService = "";
  List<DateTime> _scheduledServices = [];

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _selectedTime = null;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _showServiceScheduledSnackBar(DateTime dateTime) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Service scheduled for ${DateFormat.yMd().add_jm().format(dateTime)}',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _navigateToScheduledServicesScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ScheduledServicesScreen(
          scheduledServices: _scheduledServices,
          selectedMonth: _selectedDate!,
        ),
      ),
    );
  }

  DateTime? xxx;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    xxx = _selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Service'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(
                _selectedDate == null
                    ? 'Select date'
                    : 'Selected date: ${DateFormat.yMd().format(_selectedDate!)}',
              ),
            ),
            SizedBox(height: 20),
            Text(
              _selectedTime == null
                  ? 'No time selected.'
                  : 'Selected time: ${_selectedTime!.format(context)}',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('Select time'),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _scheduledService = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter scheduled service',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedDate == null ||
                    _selectedTime == null ||
                    _scheduledService == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Please select both date and time and enter the scheduled service.'),
                    ),
                  );
                } else {
                  _showServiceScheduledSnackBar(DateTime(
                    _selectedDate!.year,
                    _selectedDate!.month,
                    _selectedDate!.day,
                    _selectedTime!.hour,
                    _selectedTime!.minute,
                  ));
                  setState(() {
                    _scheduledServices.add(DateTime(
                      _selectedDate!.year,
                      _selectedDate!.month,
                      _selectedDate!.day,
                      _selectedTime!.hour,
                      _selectedTime!.minute,
                    ));
                  });
                }
              },
              child: Text('Schedule Service'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToScheduledServicesScreen,
              child: Text('View scheduled services'),
            ),
          ],
        ),
      ),
    );
  }
}