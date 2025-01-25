import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:travel_bee/widgets/listing_page/list_card.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({super.key, this.listData});

  final List<String>? listData;

  

  @override
  Widget build(context) {
    const double cardHeight = 110;

    return const Layout(
      child: Column(
        children: [
          ListCard(
            cardHeight: cardHeight,
            
          ),
          
        ],
      ),
    );
  }
}
