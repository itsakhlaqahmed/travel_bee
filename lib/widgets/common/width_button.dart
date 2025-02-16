import 'package:flutter/material.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/font_theme.dart';
import 'package:travel_bee/themes/theme_layout.dart';

class WidthButton extends StatelessWidget {
  const WidthButton({
    super.key,
    required this.text,
    required this.onClick,
    required this.isLoading,
  });

  final String text;
  final Function() onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? () {
              print('click');
            }
          : onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          isLoading ? 10 : 20,
        ),
        decoration: BoxDecoration(
          color: ColorTheme.primaryColor,
          borderRadius: BorderRadius.circular(ThemeLayout.fullRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: ColorTheme.backgroundGrey,
                  ),
                )
              : Text(
                  text,
                  style: FontTheme.subHeadingStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
