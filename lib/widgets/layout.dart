import 'package:flutter/material.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/top_bar.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.child,
    this.disablePadding,
    this.topBar,
  });

  final Widget? child;
  final bool? topBar;
  final bool? disablePadding;
  // final bool

  @override
  Widget build(context) {

    final double padding = disablePadding == true ? 0 : ThemeLayout.edgeHorizontalPadding ;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (topBar != false) const TopBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: padding,
                      ),
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
