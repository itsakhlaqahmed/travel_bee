import 'package:flutter/material.dart';

import 'package:travel_bee/widgets/home/card_gallery.dart';
import 'package:travel_bee/widgets/layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const Layout(
      child: CardGallery(),
    );
  }
}
