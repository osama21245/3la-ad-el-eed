 add_product
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

 add_shop

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:_3la_ad_el_eed/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ShopsRemoteDataSource {

  final CollectionReference shopsRequests = FirebaseFirestore.instance.collection('shop category request');
  Future<void>addShop(Shop shop)async{
    final user = FirebaseAuth.instance.currentUser;
    final docRef = shopsRequests.doc();

    final shopWithIdAndEmail = shop.toJson()
      ..addAll({'id': docRef.id,'email' :'hassanhany@gmail.com','userID':user!.uid});
    await docRef.set(shopWithIdAndEmail);

  }

  Future<String> uploadImage(File file) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('shops_images/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }


//example

import 'package:http/http.dart' as http;

class ShopsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getShops() async {
    final response = await http.get(Uri.parse('https://api.example.com/shops'));
    return response.body as List<Map<String, dynamic>>;
  }
 development
 development
}
