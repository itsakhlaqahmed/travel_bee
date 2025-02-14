import 'package:flutter/material.dart';

class EventImageHeader extends StatelessWidget {
  const EventImageHeader({
    super.key,
    required this.imageHeight,
    required this.imageUrl,
  });

  final double imageHeight;
  final String imageUrl;

  void clearImageCache(String imageUrl) {
  final imageProvider = NetworkImage(imageUrl);
  imageProvider.evict();
}


  @override
  Widget build(BuildContext context) {

clearImageCache(imageUrl);
    return Stack(
      children: [
        Container(
          height: imageHeight,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(48),
              bottomRight: Radius.circular(48),
            ),
          ),
          child: Image.network(
            // '$imageUrl?/${DateTime.now().millisecondsSinceEpoch}',
            filterQuality: FilterQuality.high,
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha((255 * .6).toInt()),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
