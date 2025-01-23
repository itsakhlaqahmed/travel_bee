import 'package:flutter/material.dart';
import 'package:travel_bee/themes/theme_layout.dart';
import 'package:travel_bee/widgets/common/top_bar.dart';
import 'package:travel_bee/widgets/common/search_bar.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            SearchBarCustom(
              onChange: (a) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ThemeLayout.edgeHorizontalPadding,
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
