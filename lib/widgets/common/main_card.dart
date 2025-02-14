import 'package:flutter/material.dart';

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
  Widget build(context) {
    final height = type == CardType.vertical ? width * (4 / 3) : width;

    return InkWell(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(85),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha((255 * .6).toInt()),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
