import 'package:flutter/material.dart';
import 'package:travel_bee/models/destination_model.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/width_button.dart';
import 'package:travel_bee/widgets/details_page/details_card.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.destination});
  final DestinationModel destination;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _cardHeight = 0.0;
  final _cardKey = GlobalKey();

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
            Stack(
              clipBehavior: Clip.none,
              children: [
                EventImageHeader(
                  imageHeight: imageHeight,
                  imageUrl: '${widget.destination.imageUrl[0]} ',
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  // child: Center(
                  child: Column(
                    children: [
                      DetailsCard(
                        key: _cardKey,
                        title: widget.destination.name,
                        location: widget.destination.city,
                        date: '20 July, 03:00 pm',
                      ),
                    ],
                  ),
                  // ),
                ),
              ],
            ),
            SizedBox(
              height: _cardHeight/2+16,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeLayout.edgeHorizontalPadding),
              child: Text(
                widget.destination.description!,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            // Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ThemeLayout.edgeHorizontalPadding),
              // child: WidthButton(),
            )
          ],
        ),
      ),
    );
  }
}
