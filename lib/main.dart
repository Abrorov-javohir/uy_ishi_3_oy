import 'package:flutter/material.dart';
import 'package:uy_ishi_3_oy/views/screens/widgets/tasks_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactsScreen(),
    );
  }
}
