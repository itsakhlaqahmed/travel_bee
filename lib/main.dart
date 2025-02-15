import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_bee/firebase_options.dart';
import 'package:travel_bee/models/destination_model.dart';
import 'package:travel_bee/pages/common/auth/auth.dart';
import 'package:travel_bee/pages/details_page.dart';
import 'package:travel_bee/pages/home.dart';
import 'package:travel_bee/pages/listing_page.dart';
import 'package:travel_bee/themes/color_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // print("******* $firebase *******");
  } catch (e) {
    // handle erro
    // print('error');
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final details = DestinationModel(
      name: "Pearly Hotel",
      city: 'Karachi',
      imageUrl: [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/24/9b/85/hotel-exterior.jpg?w=1200&h=-1&s=1'
      ],
      country: 'Pakistan',
      description: """This is descript for a sdfs sdfsdfsd dfsfasfdfs safdsfds This is descript for a sdfs sdfsdfsd dfsfasfdfs safdsfdsThis is descript for a sdfs sdfsdfsd dfsfasfdfs safdsfds This is descript for a sdfs sdfsdfsd dfsfasfdfs safdsfds
          """,
    );

    return MaterialApp(
      title: 'Travel Bee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.primaryColor),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home: DetailsPage(destination: details),
    );
  }
}
