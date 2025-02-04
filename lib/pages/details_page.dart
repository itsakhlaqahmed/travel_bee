import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/details_page/details_card.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

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
                imageUrl:
                    'https://profit.pakistantoday.com.pk/wp-content/uploads/2020/10/31-1.jpg',
              ),
              const Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: DetailsCard(
                    title: 'National Creativity',
                    location: 'California, USA',
                    date: '20 July, 03:00 pm',
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
