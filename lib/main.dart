import 'package:flutter/material.dart';
import 'package:football_news/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anything FootballShop',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 28, 212, 68)).copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: MyHomePage(),
    );
  }
}

