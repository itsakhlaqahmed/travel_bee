class PackageModel {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final double price;
  final String company;
  final List<String> locations;
  final String image;
  final String description;
  final double rating;
  final int duration; 

  PackageModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.company,
    required this.locations,
    required this.image,
    required this.description,
    required this.rating,
    required this.duration,
  });

  factory PackageModel.fromFirestore(Map<String, dynamic> data, String id) {
    return PackageModel(
      id: id,
      name: data['name'] ?? '',
      startDate: data['startDate'] ?? '21-02-2025',
      endDate: data['startDate'] ?? '30-02-2025',
      price: (data['price'] ?? 0).toDouble(),
      company: data['company'] ?? '',
      locations: List<String>.from(data['locations'] ?? []),
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      duration: data['duration'] ?? 0,
      // isPopular: data['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      // 'price': price,
      // 'company': company,
      // // 'locations': locations,
      // 'images': image,
      // 'description': description,
      // 'rating': rating,
      // 'duration': duration,
      // 'isPopular': isPopular,
    };
  }
}
