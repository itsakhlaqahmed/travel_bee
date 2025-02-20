import 'package:flutter/material.dart';
import 'package:travel_bee/pages/home.dart';
import 'package:travel_bee/pages/listing_page.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/pages/package_details.dart';
import 'package:travel_bee/pages/packages_page.dart';
import 'package:travel_bee/pages/review.dart';
import 'package:travel_bee/themes/color_theme.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: ColorTheme.primaryColor,
        color: ColorTheme.primaryColorTint,
        // buttonBackgroundColor: Color.fromARGB(255, 236, 224, 206),
        height: 64,
        iconPadding: 16,
        items: [
          CurvedNavigationBarItem(
            child: Icon(PhosphorIcons.house()),
          ),
          CurvedNavigationBarItem(
            child: Icon(PhosphorIcons.magnifyingGlass()),
          ),
          CurvedNavigationBarItem(
            child: Icon(PhosphorIcons.heart()),
          ),
          CurvedNavigationBarItem(
            child: Icon(PhosphorIcons.user()),
          ),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _tabIndex,
        children: [
          const Home(),
          ListingPage(),
          PackagesPage(),
          ReviewFormScreen()
        ],
      ),
    );
  }
}
