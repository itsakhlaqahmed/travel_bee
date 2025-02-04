import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_bee/pages/common/auth/auth.dart';
import 'package:travel_bee/pages/details_page.dart';
import 'package:travel_bee/pages/home.dart';
import 'package:travel_bee/pages/listing_page.dart';
import 'package:travel_bee/themes/color_theme.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.primaryColor),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home:  Auth(),
    );
  }
}

// tasks
// set color theme
// set responsive text theme
// finalize top bar with fonts
