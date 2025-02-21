import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/models/package_model.dart';

class PackageNotifier extends StateNotifier<List<PackageModel>> {
  PackageNotifier() : super([]); // Initial empty list

  void addPackage(PackageModel package) {
    state = [...state, package]; // Add new package
  }
}

// ✅ Correct provider type
final packageProvider = StateNotifierProvider<PackageNotifier, List<PackageModel>>(
  (ref) => PackageNotifier(),
);
