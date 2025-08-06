import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  late FirebaseFirestore _firestore;

  FirestoreService() {
    _firestore = FirebaseFirestore.instance;
  }

  FirebaseFirestore get firestore => _firestore;

  Future<void> addData({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(collectionPath)
        .doc(data['name'])
        .set(data)
        .timeout(const Duration(seconds: 60));
  }
}
