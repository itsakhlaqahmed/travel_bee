import 'package:flutter/material.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/theme_layout.dart';

class SearchBarCustom extends StatefulWidget {
  const SearchBarCustom({
    super.key,
    required this.onChange,
  });

  final void Function(String?) onChange;

  @override
  State<SearchBarCustom> createState() => _SearchBarCustom();
}

class _SearchBarCustom extends State<SearchBarCustom> {
  void a() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ThemeLayout.edgeHorizontalPadding,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: ColorTheme.backgroundGrey,
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          onChanged: widget.onChange,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            hintText: 'Search Places',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
