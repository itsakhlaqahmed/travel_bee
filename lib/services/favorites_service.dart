import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteService {
  final CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');

  Future<void> addFavorite(String userId, String? destinationId, String? hotelId) {
    return favorites.add({
      'userId': userId,
      'destinationId': destinationId,
      'hotelId': hotelId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getUserFavorites(String userId) {
    return favorites.where('userId', isEqualTo: userId).snapshots();
  }
}
