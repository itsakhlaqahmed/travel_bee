import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';

class DetailsPane extends StatelessWidget {
  const DetailsPane({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final imgHeight = height * .4;
    return Stack(
      children: [
        EventImageHeader(
          imageUrl:
              'https://profit.pakistantoday.com.pk/wp-content/uploads/2020/10/31-1.jpg',
          imageHeight: imgHeight,
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        )
      ],
    );
  }
}
