class UserModel {
  final String userId;
  final String name;
  final String email;
  final String profilePicture;
  final String location;
  final String bio;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.location,
    required this.bio,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      userId: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
      location: data['location'] ?? '',
      bio: data['bio'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'location': location,
      'bio': bio,
    };
  }
}
