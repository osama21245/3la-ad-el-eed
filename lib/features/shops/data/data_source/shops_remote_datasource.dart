import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ShopsRemoteDataSource {
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  });

  Future<List<Map<String, dynamic>>> fetchProducts();
}

class ShopsRemoteDataSourceImpl implements ShopsRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  ShopsRemoteDataSourceImpl({required this.firestore,required this.storage});
  @override
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  }) async {
    final ref = storage
        .ref()
        .child('product_images')
        .child(imageFile.path.split('/').last);
    await ref.putFile(imageFile);

    final imageUrl = await ref.getDownloadURL();

    await firestore
        .collection('category')
        .doc('restaurants')
        .collection('shops')
        .doc('n2W0vTrpDYdc70rpyTWq')
        .collection('products')
        .add({
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final snapshot = await firestore
        .collection('category')
        .doc('restaurants')
        .collection('shops')
        .doc('n2W0vTrpDYdc70rpyTWq')
        .collection('products')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
