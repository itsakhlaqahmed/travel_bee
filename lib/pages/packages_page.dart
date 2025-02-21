import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/providers/package_provider.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:travel_bee/widgets/package_page/package_card.dart';

class PackagesPage extends ConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final packages = ref.watch(packageProvider);

    return Layout(
      child: packages.when(
        data: (data) {
          return Column(
            children: [
              ...data.map((package) {
                return TravelCard(
                  package: package,
                );
              }),
            ],
          );
        },
        error: (err, stack) => Text(err.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
