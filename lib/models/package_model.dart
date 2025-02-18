class PackageModel {
  final String id;
  final String name;
  final List<DateTime> dates;
  final double price;
  final String company;
  final List<String> locations;
  final List<String> images;
  final String description;
  final double rating;
  final int duration; // in days
  final bool isPopular;

  PackageModel({
    required this.id,
    required this.name,
    required this.dates,
    required this.price,
    required this.company,
    required this.locations,
    required this.images,
    required this.description,
    required this.rating,
    required this.duration,
    required this.isPopular,
  });

  factory PackageModel.fromFirestore(Map<String, dynamic> data, String id) {
    return PackageModel(
      id: id,
      name: data['name'] ?? '',
      dates: (data['dates'] as List<dynamic>).map((e) => DateTime.parse(e)).toList(),
      price: (data['price'] ?? 0).toDouble(),
      company: data['company'] ?? '',
      locations: List<String>.from(data['locations'] ?? []),
      images: List<String>.from(data['images'] ?? []),
      description: data['description'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      duration: data['duration'] ?? 0,
      isPopular: data['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'dates': dates.map((e) => e.toIso8601String()).toList(),
      'price': price,
      'company': company,
      'locations': locations,
      'images': images,
      'description': description,
      'rating': rating,
      'duration': duration,
      'isPopular': isPopular,
    };
  }
}
