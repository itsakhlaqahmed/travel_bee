import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel user) {
    return users.add(user.toFirestore()..addAll({'createdAt': FieldValue.serverTimestamp()}));
  }

  Stream<UserModel> getUser(String userId) {
    return users.doc(userId).snapshots().map(
      (snapshot) {
        if (snapshot.exists) {
          return UserModel.fromFirestore(snapshot.data() as Map<String, dynamic>, snapshot.id);
        } else {
          throw Exception("User not found");
        }
      },
    );
  }

  Future<void> updateUser(String userId, Map<String, dynamic> data) {
    return users.doc(userId).update(data);
  }

  Future<void> deleteUser(String userId) {
    return users.doc(userId).delete();
  }
}
