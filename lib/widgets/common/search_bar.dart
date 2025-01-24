import 'package:flutter/material.dart';
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
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          onChanged: widget.onChange,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          decoration: const InputDecoration(
            hintText: 'Search Places',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
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
