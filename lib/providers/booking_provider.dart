import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/models/booking_model.dart';
import 'package:travel_bee/providers/providers.dart';


final bookingProvider = StreamProvider.family<List<BookingModel>, String>((ref, userId) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('bookings')
      .where('userId', isEqualTo: userId)
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) =>
            BookingModel.fromFirestore(doc.data(), doc.id)).toList();
      });
});
