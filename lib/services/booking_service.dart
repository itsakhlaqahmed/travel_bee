import 'package:cloud_firestore/cloud_firestore.dart';

class BookingService {
  final CollectionReference bookings = FirebaseFirestore.instance.collection('bookings');

  Future<void> addBooking(String userId, String hotelId, DateTime checkIn, DateTime checkOut, int guests, double totalPrice) {
    return bookings.add({
      'userId': userId,
      'hotelId': hotelId,
      'checkInDate': checkIn,
      'checkOutDate': checkOut,
      'guests': guests,
      'totalPrice': totalPrice,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getUserBookings(String userId) {
    return bookings.where('userId', isEqualTo: userId).snapshots();
  }
}
