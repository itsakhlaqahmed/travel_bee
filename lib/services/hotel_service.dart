import 'package:cloud_firestore/cloud_firestore.dart';

class HotelService {
  final CollectionReference hotels = FirebaseFirestore.instance.collection('hotels');

  Future<void> addHotel(String name, String city, String country, String destinationId, String address, double price, double rating, String amenities, String imageUrl, String contact, String website) {
    return hotels.add({
      'name': name,
      'city': city,
      'country': country,
      'destinationId': destinationId,
      'address': address,
      'pricePerNight': price,
      'rating': rating,
      'amenities': amenities,
      'imageUrl': imageUrl,
      'contactNumber': contact,
      'websiteUrl': website,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getHotels(String city) {
    return hotels.where('city', isEqualTo: city).snapshots();
  }
}
