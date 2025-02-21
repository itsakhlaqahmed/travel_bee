import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_bee/models/package_model.dart';
import 'package:travel_bee/pages/package_details.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/font_theme.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({super.key, required this.package});

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Packages",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Over 10000 visitors",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PackageDetailsPage(
                            name: package.name,
                            duration: package.duration.toString(),
                            price: package.price,
                            startDate: package.startDate,
                            endDate: package.endDate,
                            image: package.image),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ColorTheme.primaryColor,
                  ),
                  child: const Text("Explore"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(package.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price for ${package.duration}",
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text("Rs. ${package.price}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            child: CachedNetworkImage(
                imageUrl: package.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
