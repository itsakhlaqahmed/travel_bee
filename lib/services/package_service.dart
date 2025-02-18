import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_bee/models/package_model.dart';

class PackageService {
  final CollectionReference packages = FirebaseFirestore.instance.collection('packages');

  // ✅ Create Package (Auto-generate ID)
  Future<void> createPackage(PackageModel package) {
    return packages.add(package.toFirestore());
  }

  // ✅ Fetch All Packages (Real-time Stream)
  Stream<List<PackageModel>> getPackages() {
    return packages.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) =>
        PackageModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
    });
  }

  // ✅ Fetch Single Package by ID
  Stream<PackageModel?> getPackageById(String packageId) {
    return packages.doc(packageId).snapshots().map((doc) {
      if (doc.exists) {
        return PackageModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    });
  }

  // ✅ Update Package
  Future<void> updatePackage(String packageId, Map<String, dynamic> data) {
    return packages.doc(packageId).update(data);
  }

  // ✅ Delete Package
  Future<void> deletePackage(String packageId) {
    return packages.doc(packageId).delete();
  }
}
