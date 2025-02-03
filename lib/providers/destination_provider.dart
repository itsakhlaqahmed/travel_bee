import 'package:riverpod/riverpod.dart';
import 'package:travel_bee/providers/providers.dart';
import '../models/destination_model.dart';

/// Fetches a list of destinations
final destinationProvider = StreamProvider<List<DestinationModel>>((ref) {
  final firestore = ref.read(firebaseProvider);
  return firestore.collection('destinations').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) =>
        DestinationModel.fromFirestore(doc.data(), doc.id)).toList();
  });
});
