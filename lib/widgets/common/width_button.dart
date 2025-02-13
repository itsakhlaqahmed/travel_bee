import 'package:flutter/material.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/themes/theme_layout.dart';

class WidthButton extends StatelessWidget {
  const WidthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(ThemeLayout.fullRadius),
        ),
        child: Center(
          child: Text(
            'Login',
            style: FontTheme.subHeadingStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
