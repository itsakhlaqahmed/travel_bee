import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/details_page/details_pane.dart';
import 'package:travel_bee/widgets/details_page/event_image_header.dart';
import 'package:travel_bee/widgets/layout.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(context) {
  

    return const Layout(
      disablePadding: true,
      topBar: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsPane(),
        ],
      ),
    );
  }
}
