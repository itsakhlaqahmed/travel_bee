import 'package:flutter/material.dart';
import 'package:travel_bee/models/hotel_model.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/details_page/details_card.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key, required this.hotel});
  final HotelModel hotel;

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  double _cardHeight = 0.0;
  final _cardKey = GlobalKey();

  Future<void> openMapWithAddress(String address) async {
    String encodedAddress =
        Uri.encodeComponent(address); // Encode spaces & special characters
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$encodedAddress");

    if (!await launchUrl(url)) {
      throw 'Could not open the map.';
    }
  }

 

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    final double imageHeight = height * .4;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _cardKey.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        _cardHeight = renderBox.size.height;
      });
    });

    return Scaffold(
      body: Layout(
        enablePadding: false,
        topBar: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                print('click open map');
                print(widget.hotel.address);
                openMapWithAddress(widget.hotel.address ?? widget.hotel.city);
              },
              child: Stack(
                clipBehavior: Clip.none,
                // clipBehavior: Clip.,
                children: [
                  EventImageHeader(
                    imageHeight: imageHeight,
                    imageUrl: '${widget.hotel.imageUrl[0]} ',
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    // child: Center(
                    child: DetailsCard(
                      key: _cardKey,
                      title: widget.hotel.name,
                      location: widget.hotel.city,
                      date: '20 July, 03:00 pm',
                      address: widget.hotel.address ?? widget.hotel.city,
                    ),
                    // ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _cardHeight / 2 + 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeLayout.edgeHorizontalPadding),
              // child: WidthButton(),
              child: AmenitiesWidget(),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeLayout.edgeHorizontalPadding),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.hotel.descripttion,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmenitiesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> amenities = [
    {"icon": Icons.king_bed, "label": "1 king bed"},
    {"icon": Icons.wifi, "label": "Free wi-fi"},
    {"icon": Icons.tv, "label": "TV"},
    {"icon": Icons.pool, "label": "Swimming Pool"},
    {"icon": Icons.restaurant, "label": "Restaurant"},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: amenities.map((amenity) {
        return Container(
          // width: 0,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                ColorTheme.primaryColor.withAlpha(80), // Light green background
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Icon(amenity["icon"], color: ColorTheme.primaryColor, size: 24),
              const SizedBox(height: 5),
              Text(
                amenity["label"],
                style: const TextStyle(
                    color: ColorTheme.primaryColor, fontSize: 12),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
