import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ShopsRemoteDataSource {
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
    required String shopId,
    required String userId,
  });

  Future<List<Map<String, dynamic>>> fetchProducts();
}

class ShopsRemoteDataSourceImpl implements ShopsRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  ShopsRemoteDataSourceImpl({required this.firestore, required this.storage});
  @override
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
    required String shopId,
    required String userId,
  }) async {
    final ref = storage
        .ref()
        .child('product_images')
        .child(imageFile.path.split('/').last);

    await ref.putFile(imageFile);
    final imageUrl = await ref.getDownloadURL();

    final productData = {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };

    await firestore.runTransaction((transaction) async {
      final shopProductRef =
          firestore
              .collection('category')
              .doc('restaurants')
              .collection('shops')
              .doc(shopId)
              .collection('products')
              .doc();

      final userProductRef = firestore
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(shopProductRef.id);

      transaction.set(shopProductRef, productData);
      transaction.set(userProductRef, productData);
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final snapshot =
        await firestore
            .collection('category')
            .doc('restaurants')
            .collection('shops')
            .doc('n2W0vTrpDYdc70rpyTWq')
            .collection('products')
            .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
