import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/font_theme.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.cardHeight,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
  });

  final double cardHeight;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: cardHeight,
            width: cardHeight,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 230, 230, 230)),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
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
                border:
                    Border.all(color: const Color.fromARGB(255, 230, 230, 230)),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: FontTheme.subHeadingStyle,
                      ),
                      // const Spacer(),
                      const SizedBox(
                        width: 16,
                      ),

                      Text(
                        rating > 0 ? rating.toString() : 4.2.toString(),
                        style: FontTheme.subHeadingStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0, left: 2),
                        child: Icon(
                          size: 14,
                          color: Colors.grey,
                          PhosphorIcons.star(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
