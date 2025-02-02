class HotelModel {
  final String id;
  final String name;
  final String city;
  final String country;
  final String destinationId;
  final String address;
  final double pricePerNight;
  final double rating;
  final String amenities;
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
      name: data['name'],
      city: data['city'],
      country: data['country'],
      destinationId: data['destinationId'],
      address: data['address'],
      pricePerNight: data['pricePerNight'].toDouble(),
      rating: data['rating'].toDouble(),
      amenities: data['amenities'],
      imageUrl: data['imageUrl'],
      contactNumber: data['contactNumber'],
      websiteUrl: data['websiteUrl'],
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
