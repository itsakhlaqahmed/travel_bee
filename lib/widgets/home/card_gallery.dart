import 'package:flutter/material.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/main_card.dart';
import 'dart:math';

class CardGallery extends StatelessWidget {
  const CardGallery({super.key});

  CardType getCardType() {
    int randomNumber = Random().nextInt(2);

    return randomNumber == 1 ? CardType.vertical : CardType.square;
  }

  @override
  Widget build(context) {
    const double gap = 12;
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2 - gap - ThemeLayout.edgeHorizontalPadding;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 12,
          children: [
            MainCard(
              width: cardWidth,
              type: CardType.vertical,
            ),
            MainCard(
              width: cardWidth,
              type: getCardType(),
            ),
            MainCard(
              width: cardWidth,
              type: getCardType(),
            ),
          ],
        ),
        const SizedBox(width: gap),
        Column(
          spacing: 12,
          children: [
            MainCard(
              width: cardWidth,
              type: CardType.square,
            ),
            MainCard(
              width: cardWidth,
              type: getCardType(),
            ),
            MainCard(
              width: cardWidth,
              type: getCardType(),
            ),
            MainCard(
              width: cardWidth,
              type: getCardType(),
            ),
          ],
        ),
      ],
    );
  }
}
