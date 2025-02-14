class DestinationModel {
  final String? id;
  final String? name;
  final String city;
  final String? country;
  final String? description;
  final String? bestTimeToVisit;
  final double? latitude;
  final double? longitude;
  final List<String> imageUrl;

  DestinationModel({
    this.id,
    this.name,
    required this.city,
    this.country,
    this.description,
    this.bestTimeToVisit,
    this.latitude,
    this.longitude,
    required this.imageUrl,
  });

  factory DestinationModel.fromFirestore(Map<String, dynamic> data, String id) {
    return DestinationModel(
      id: id,
      name: data['name'],
      city: data['city'],
      country: data['country'],
      description: data['description'],
      bestTimeToVisit: data['bestTimeToVisit'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      imageUrl: data['imageUrls'].cast<String>(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'city': city,
      'country': country,
      'description': description,
      'bestTimeToVisit': bestTimeToVisit,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
    };
  }
}
