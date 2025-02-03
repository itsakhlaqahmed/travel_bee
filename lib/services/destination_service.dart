import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final CollectionReference destinations =
      FirebaseFirestore.instance.collection('destinations');

  Future<void> addDestination(
      String name,
      String city,
      String country,
      String description,
      String bestTime,
      double lat,
      double lon,
      String imageUrl) {
    return destinations.add({
      'name': name,
      'city': city,
      'country': country,
      'description': description,
      'bestTimeToVisit': bestTime,
      'latitude': lat,
      'longitude': lon,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getDestinations() {
    return destinations.snapshots();
  }
}
