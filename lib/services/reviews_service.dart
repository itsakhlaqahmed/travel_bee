import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService {
  final CollectionReference reviews = FirebaseFirestore.instance.collection('reviews');

  Future<void> addReview(String userId, String? destinationId, String? hotelId, int rating, String reviewText, String imageUrl) {
    return reviews.add({
      'userId': userId,
      'destinationId': destinationId,
      'hotelId': hotelId,
      'rating': rating,
      'reviewText': reviewText,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getReviewsForDestination(String destinationId) {
    return reviews.where('destinationId', isEqualTo: destinationId).snapshots();
  }

  Stream<QuerySnapshot> getReviewsForHotel(String hotelId) {
    return reviews.where('hotelId', isEqualTo: hotelId).snapshots();
  }
}
