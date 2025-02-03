import 'package:riverpod/riverpod.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart'; // Import your model
import 'package:travel_bee/providers/providers.dart';

/// Fetches user data from Firestore
final userProvider = StreamProvider.family<UserModel, String>((ref, userId) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('users').doc(userId).snapshots().map((snapshot) {
    return UserModel.fromFirestore(snapshot.data()!, snapshot.id);
  });
});
