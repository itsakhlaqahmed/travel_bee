import 'package:flutter/material.dart';
import 'package:travel_bee/providers/destination_provider.dart';

import 'package:travel_bee/widgets/home/card_gallery.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(destinationProvider);

    return data.when(
      data: (data) {
        return Layout(
          child: CardGallery(
            data: data,
          ),
        );
      },
      error: (error, _) => Layout(
        child: Text('error1 $error'),
      ),
      loading: () => const Layout(
        child: Text('loading'),
      ),
    );
  }
}
