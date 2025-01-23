import 'package:flutter/material.dart';

enum CardType { square, vertical }

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.width,
    required this.type,
  });

  final double width;
  final CardType type;

  @override
  Widget build(context) {
    final height = type == CardType.vertical ? width * (4 / 3) : width;

    return InkWell(
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
              'https://profit.pakistantoday.com.pk/wp-content/uploads/2020/10/31-1.jpg',
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
            const Positioned(
              bottom: 12,
              child: Center(
                child: Text(
                  'The Karachi City',
                  style: TextStyle(
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
