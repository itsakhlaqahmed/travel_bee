import 'package:flutter/material.dart';
import 'package:travel_bee/widgets/layout.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.cardHeight,
  });

  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: cardHeight,
          width: cardHeight,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: cardHeight,
            // width: cardHeight,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
