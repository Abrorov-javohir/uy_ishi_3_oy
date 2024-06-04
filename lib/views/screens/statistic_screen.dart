import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/Controller/Task_Controller.dart';

class StatisticsScreen extends StatelessWidget {
  final ContactsController contactsController;

  StatisticsScreen({required this.contactsController});

  @override
  Widget build(BuildContext context) {
    final int completedTasks = contactsController.countCompleted();
    final int uncompletedTasks = contactsController.countUncompleted();
    final int reminders = contactsController.countReminders();

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Completed Tasks: $completedTasks', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Uncompleted Tasks: $uncompletedTasks', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Reminders: $reminders', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
