import 'package:flutter/material.dart';

class CityGrid extends StatelessWidget {
  final List<String> cities;

  const CityGrid({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    int columns = cities.length < 3 ? cities.length : 3;
    double cardWidth = MediaQuery.of(context).size.width / columns - 16;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: cities.map((city) {
          return SizedBox(
            width: cities.length < 3 ? double.infinity : cardWidth,
            child: _CityCard(city: city),
          );
        }).toList(),
      ),
    );
  }
}

class _CityCard extends StatelessWidget {
  final String city;

  const _CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_city, color: Colors.orange),
          const SizedBox(width: 6),
          Text(
            city,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
