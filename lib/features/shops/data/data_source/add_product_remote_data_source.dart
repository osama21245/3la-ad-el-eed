import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class AddProductRemoteDataSource {
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  });
}

class AddProductRemoteDataSourceImpl implements AddProductRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  AddProductRemoteDataSourceImpl({
    required this.firestore,
    required this.storage,
  });

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

    await firestore.collection('products').add({
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    });
  }
}