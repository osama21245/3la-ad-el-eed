import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/shop.dart';

class YourShopRemoteDataSource {

  final CollectionReference shopsRequests = FirebaseFirestore.instance.collection('shop category request');
  Future<DocumentSnapshot> getYourShop()async{

    QuerySnapshot querySnapshot = await shopsRequests.where('email' ,isEqualTo: 'hassanhany@gmail.com').get();


    return querySnapshot.docs.first;
  }
  Future<void>addYourShop(Shop shop ,String category)async{
    final CollectionReference shopsCategory = FirebaseFirestore.instance.collection('category').doc(category).collection('shops');
    await shopsCategory.add(shop.toJson());
  }
  Future<void>deleteYourRejectedRequest(Shop shop)async{
    await shopsRequests.doc(shop.id).delete();
  }

  Future<String> uploadImage(File file) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('shops_images/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

}