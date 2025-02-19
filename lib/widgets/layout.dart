import 'package:flutter/material.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/top_bar.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
    this.child,
    this.topBar,
    this.enablePadding = true,
  });

  final Widget? child;
  final bool? topBar;
  final bool? enablePadding;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  @override
  Widget build(context) {
    final double padding =
        widget.enablePadding != true ? 0 : ThemeLayout.edgeHorizontalPadding;

    return SafeArea(
      child: Column(
        children: [
          if (widget.topBar != false) const TopBar(),

          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: widget.topBar != false ? 24 : 0,
                      horizontal: padding,
                    ),
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 32,
          // )
        ],
      ),
    );
  }
}
