import 'package:flutter/material.dart';
import 'package:travel_bee/models/destination_model.dart';
import 'package:travel_bee/pages/details_page.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/main_card.dart';
import 'dart:math';

class CardGallery extends StatelessWidget {
  const CardGallery({
    super.key,
    required this.data,
  });

  final List<DestinationModel> data;

  CardType getCardType() {
    int randomNumber = Random().nextInt(2);
    return randomNumber == 1 ? CardType.vertical : CardType.square;
  }

  void goToDetailsPage(ctx, destination) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => DetailsPage(
          destination: destination,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    const double gap = 12;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2 - gap - ThemeLayout.edgeHorizontalPadding;

    final column1 = data
        .asMap()
        .entries
        .where((destination) => destination.key.isEven)
        .map((destination) {
      return MainCard(
        key: GlobalKey(),
        width: cardWidth,
        type: getCardType(),
        image: destination.value.imageUrl[0],
        title: destination.value.name,
        onTap: () => goToDetailsPage(context, destination.value),
      );
    }).toList();

    final column2 =
        data.asMap().entries.where((e) => e.key.isOdd).map((destination) {
      return MainCard(
        key: GlobalKey(),
        width: cardWidth,
        type: getCardType(),
        image: destination.value.imageUrl[0],
        title: destination.value.name,
        onTap: () => goToDetailsPage(context, destination.value),
      );
    }).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 12,
          children: [
            ...column1,
          ],
        ),
        const SizedBox(width: gap),
        Column(
          spacing: 12,
          children: [
            ...column2
          ],
        ),
      ],
    );
  }
}
