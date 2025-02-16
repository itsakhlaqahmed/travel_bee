class HotelModel {
  final String id;
  final String name;
  final String city;
  final String country;
  final String destinationId;
  final String address;
  final double pricePerNight;
  final double rating;
  final List<dynamic>  amenities;
  final List<String> imageUrl;
  final String contactNumber;
  final String websiteUrl;

  HotelModel({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.destinationId,
    required this.address,
    required this.pricePerNight,
    required this.rating,
    required this.amenities,
    required this.imageUrl,
    required this.contactNumber,
    required this.websiteUrl,
  });

  factory HotelModel.fromFirestore(Map<String, dynamic> data, String id) {
    return HotelModel(
      id: id,
      name: data['name'] ?? 'null',
      city: data['city'] ?? 'null',
      country: data['country'] ?? 'null',
      destinationId: data['destinationId'] ?? 'null',
      address: data['address'] ?? 'null',
      pricePerNight: data['pricePerNight'] ?? 0.1,
      rating: data['rating'] ?? 0.1,
      amenities: data['amenities'] ?? 'null',
      imageUrl: [],
      contactNumber: data['contactNumber'] ?? 'null',
      websiteUrl: data['websiteUrl'] ?? 'null',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'city': city,
      'country': country,
      'destinationId': destinationId,
      'address': address,
      'pricePerNight': pricePerNight,
      'rating': rating,
      'amenities': amenities,
      'imageUrl': imageUrl,
      'contactNumber': contactNumber,
      'websiteUrl': websiteUrl,
    };
  }
}
