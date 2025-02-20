import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum CardType { square, vertical }

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.width,
    required this.type,
    required this.image,
    required this.title,
    this.onTap,
  });

  final double width;
  final CardType type;
  final String image;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final double height = type == CardType.vertical ? width * (4 / 3) : width;

    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // 🌆 Background Image
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),

              // 🌓 Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),

              // 🏷 Title Text
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
