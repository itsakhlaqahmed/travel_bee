import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final String location;
  final String? date;
  final String? address;
  final List<double>? latLng;
  // final double Function(AboutListTile) cardHeightOnRender;

  const DetailsCard({
    super.key,
    required this.title,
    required this.location,
    this.latLng,
    this.date,
    this.address,
    // required this.cardHeightOnRender,
  });

  @override
  Widget build(BuildContext context) {
    // final _cardKey = GlobalKey();
    // final width = me
    Future<void> openMapWithAddress(String address) async {
      String encodedAddress =
          Uri.encodeComponent(address); // Encode spaces & special characters
      final Uri url = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$encodedAddress");

      if (!await launchUrl(url)) {
        throw 'Could not open the map.';
      }
    }

    Future<void> openMap(double lat, double lng) async {
      final Uri url = Uri.parse("geo:$lat,$lng?q=$lat,$lng");
      if (!await launchUrl(url)) {
        throw 'Could not open the map.';
      }
    }

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
                overflow: TextOverflow.ellipsis,
                style: FontTheme.subHeadingStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
              mainAxisSize: MainAxisSize.min,  // Fix click issues
            children: [
              Icon(
                PhosphorIcons.calendarBlank(),
                size: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              AbsorbPointer(

                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    print('open map clicked');
                    if (latLng != null) {
                      openMap(latLng![0], latLng![1]);
                    } else {
                      openMapWithAddress(address!);
                    }
                  },
                  child: Text(
                    'Tap name to open location on Map',
                    style: FontTheme.subHeadingStyle.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
