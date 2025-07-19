import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRemoteDataSource {
  Future<void> blockUser(String userId);
  Future<bool> isUserBlocked(String userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> blockUser(String userId) async {
    await firestore.collection('users').doc(userId).update({'is_blocked': true});
  }

  @override
  Future<bool> isUserBlocked(String userId) async {
    final doc = await firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return doc.data()?['isBlocked'] == true;
    }
    return false;
  }
}
