import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/helpers/image_converter.dart';

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

  AddProductRemoteDataSourceImpl({required this.firestore});
  @override
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  }) async {
    final imageBase64 = await convertImageToBase64(imageFile);

    await FirebaseFirestore.instance.collection('products').add({
      'name': name,
      'description': description,
      'price': price,
      'imageBase64': imageBase64, // saved as a string
    });
  }
}
