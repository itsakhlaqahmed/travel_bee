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

// final hotelProviderByName =  Provider.family<List<HotelModel>, String>((ref, query) {
//   final hotels = ref.watch(hotelProvider).maybeWhen<List<HotelModel>>(
//     data: (hotels) => hotels, 
//     orElse: () => [], 
//   );

//   if (query.isEmpty) return hotels; 

//   return hotels.where((hotel) =>
//       hotel.name.toLowerCase().contains(query.toLowerCase())).toList();
// });

final hotelProviderByName =
    StreamProvider.family<List<HotelModel>, String>((ref, query) {
  final firestore = ref.read(firebaseProvider);

  return firestore.collection('hotels')
      .where('name', isGreaterThanOrEqualTo: query)
      .where('name', isLessThan: '$query\uf8ff') // Ensures correct filtering
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) =>
          HotelModel.fromFirestore(doc.data(), doc.id)).toList());
});



final hotelProvider = StreamProvider<List<HotelModel>>((ref) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('hotels').snapshots().map((snapshot) {
    return snapshot.docs
        .map((doc) => HotelModel.fromFirestore(doc.data(), doc.id))
        .toList();
  });
});
