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
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              // height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha((255 * .8).toInt()),
                    // Color.fromARGB(255, 236, 224, 206)
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  title.length <= 16 ? title : '${title.substring(0, 16)}...',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(1, 1)
                      ),
                    ],
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
