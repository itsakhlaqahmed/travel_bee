import 'package:flutter/material.dart';
import 'package:travel_bee/models/package_model.dart';

class OrderListPage extends StatelessWidget {
  final List<PackageModel> packages;

  const OrderListPage({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
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
                child: Image.network(
                  package.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                package.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "\$${package.price.toStringAsFixed(2)} • ${package.duration} days",
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600, size: 16),
              onTap: () {
                // Navigate to package details if needed
              },
            ),
          );
        },
      ),
    );
  }
}
