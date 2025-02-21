import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/models/package_model.dart';
import 'package:travel_bee/providers/providers.dart';
import 'package:travel_bee/services/package_service.dart';

final packageProvider = StreamProvider<List<PackageModel>>((ref) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('packages').snapshots().map((snapshot) {
    print(snapshot.docs[0].data());
    return snapshot.docs
        .map((doc) => PackageModel.fromFirestore(doc.data(), doc.id))
        .toList();
  });
});


final singlePackageProvider =
    StreamProvider.family<PackageModel?, String>((ref, packageId) {
  final firestore = ref.read(firebaseProvider);

  return firestore.collection('packages').doc(packageId).snapshots().map((doc) {
    return doc.exists
        ? PackageModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)
        : null;
  });
});

final packageServiceProvider = Provider((ref) => PackageService());
