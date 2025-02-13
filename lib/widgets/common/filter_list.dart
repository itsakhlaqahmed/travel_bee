import 'package:flutter/material.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/font_theme.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      // height: 40,
      decoration: BoxDecoration(
        color: ColorTheme.backgroundGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Karachi',
                  style:
                      FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'Islamabad',
                  style:
                      FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'Lahore',
                  style:
                      FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'Quetta',
                  style:
                      FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
