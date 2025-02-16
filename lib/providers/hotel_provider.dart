import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/models/hotel_model.dart';
import 'package:travel_bee/providers/providers.dart';

final hotelProviderByCity =
    StreamProvider.family<List<HotelModel>, String>((ref, city) {
  final firestore = ref.read(firebaseProvider);
  return firestore
      .collection('hotels')
      .where('city', isEqualTo: city)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs
        .map((doc) => HotelModel.fromFirestore(doc.data(), doc.id))
        .toList();
  });
});


final hotelProvider = StreamProvider<List<HotelModel>>((ref) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('hotels').snapshots().map((snapshot) {
    return snapshot.docs
        .map((doc) => HotelModel.fromFirestore(doc.data(), doc.id))
        .toList();
  });
});
