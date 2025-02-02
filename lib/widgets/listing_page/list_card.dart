import 'package:flutter/material.dart';
import 'package:travel_bee/themes/font_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.cardHeight,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final double cardHeight;
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: cardHeight,
          width: cardHeight,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 6,
                spreadRadius: 2,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Image.network(
            fit: BoxFit.cover,
            imageUrl,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: cardHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // color: Colors.black87
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  description,
                  style: FontTheme.subHeadingStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
