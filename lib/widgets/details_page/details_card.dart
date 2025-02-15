import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/font_theme.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  // final double Function(AboutListTile) cardHeightOnRender;

  const DetailsCard({
    super.key,
    required this.title,
    required this.location,
    required this.date,
    // required this.cardHeightOnRender,
  });

  @override
  Widget build(BuildContext context) {

    // final _cardKey = GlobalKey();
    // final width = me

    return Container(
      // key: ,
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: FontTheme.titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              
              Icon(
                PhosphorIcons.mapPin(),
                size: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                location,
                style: FontTheme.subHeadingStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                PhosphorIcons.calendarBlank(),
                size: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                date,
                style: FontTheme.subHeadingStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
