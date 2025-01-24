import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/theme_layout.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black54,
      padding: EdgeInsets.symmetric(
        horizontal: ThemeLayout.edgeHorizontalPadding,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Logo"),
          const SizedBox(width: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              PhosphorIcons.user(),
            ),
          ),
        ],
      ),
    );
  }
}
