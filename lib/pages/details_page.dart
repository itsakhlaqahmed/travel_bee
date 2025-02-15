import 'package:flutter/material.dart';
import 'package:travel_bee/models/destination_model.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/details_page/details_card.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.destination});
  final DestinationModel destination;

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    final double imageHeight = height * .4;

    return Layout(
      enablePadding: false,
      topBar: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              EventImageHeader(
                imageHeight: imageHeight,
                imageUrl: '${destination.imageUrl[0]} ',
              ),
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                // child: Center(
                child: Column(
                  children: [
                    DetailsCard(
                      title: destination.name!,
                      location: destination.city,
                      date: '20 July, 03:00 pm',
                    ),
                  ],
                ),
                // ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeLayout.edgeHorizontalPadding),
            child: Text(
              destination.description!,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
