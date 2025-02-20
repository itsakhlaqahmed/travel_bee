import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:travel_bee/widgets/package_page/package_card.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          TravelCard(),
          TravelCard()
        ],
      ),
    );
    }

}