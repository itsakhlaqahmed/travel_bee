import 'package:flutter/material.dart';
import 'package:travel_bee/pages/details_page.dart';
import 'package:travel_bee/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Bee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetailsPage(),
    );
  }
}

// tasks 
// set color theme
// set responsive text theme
// finalize top bar with fonts
