import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
