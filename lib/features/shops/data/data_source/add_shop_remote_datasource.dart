import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddShopRemoteDatasource {
  final CollectionReference shopsRequests = FirebaseFirestore.instance
      .collection('shop category request');
  getShops() {}

  Future<void> addShop({required Shop shop}) async {
    final user = FirebaseAuth.instance.currentUser;
    final docRef = shopsRequests.doc();

    final shopWithIdAndEmail =
        shop.toJson()..addAll({
          'id': docRef.id,
          'email': 'hassanhany@gmail.com',
          'userID': user!.uid,
        });
    await docRef.set(shopWithIdAndEmail);
  }

  Future<String> uploadImage(File file) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('shops_images/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
