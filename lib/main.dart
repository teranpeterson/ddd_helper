import 'package:ddd_helper/screens/dice_screen.dart';
import 'package:ddd_helper/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromRGBO(80, 120, 170, 1)),
      home: const HomeScreen(),
    );
  }
}
