import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/models/package_model.dart';
import 'package:travel_bee/providers/package_provider.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/widgets/layout.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(packageProvider);

    return Scaffold(
      body: Layout(
        child: data.when(
            data: (data) {
              return OrderListPage(
                packages: data.sublist(1, 3),
              );
            },
            error: (err, sta) => Text(err.toString()),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}

class OrderListPage extends StatelessWidget {
  final List<PackageModel> packages;

  const OrderListPage({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
               imageUrl:  package.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                // errorBuilder: (context, error, stackTrace) {
                //   return Container(
                //     width: 60,
                //     height: 60,
                //     color: Colors.grey.shade300,
                //     child: const Icon(Icons.image, color: Colors.grey),
                //   );
                // },
              ),
            ),
            title: Text(
              package.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Rs. ${package.price.toStringAsFixed(2)} • ${Random().nextInt(10)} days",
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.grey.shade600, size: 16),
            onTap: () {
              // Navigate to package details if needed
            },
          ),
        );
      },
    );
  }
}
