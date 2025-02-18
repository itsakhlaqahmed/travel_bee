import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:travel_bee/themes/theme_layout.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorTheme.primaryColorTint,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ThemeLayout.edgeHorizontalPadding,
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo_cropped.jpg',
            width: 150,
          ),
          // Text(
          //   "@travel bee",
          //   style: GoogleFonts.cormorantGaramond().copyWith(
          //     fontSize: 32,
          //     fontWeight: FontWeight.w900,
          //     color: ColorTheme.primaryColor,
          //   ),
          // ),
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
