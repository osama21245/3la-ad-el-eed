import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseLocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<Map<String, dynamic>> listenToDriverLocation({
    required String driverId,
  }) {
    return _firestore.collection('drivers').doc(driverId).snapshots().map((
      snapshot,
    ) {
      final data = snapshot.data();
      if (data == null ||
          data.isEmpty ||
          !data.containsKey('latitude') ||
          !data.containsKey('longitude')) {
        throw Exception('Invalid location data');
      }

      return snapshot.data() as Map<String, dynamic>;
    });
  }
}
