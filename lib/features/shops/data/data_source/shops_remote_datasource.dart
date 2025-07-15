//example
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:_3la_ad_el_eed/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class ShopsRemoteDataSource {
  // Future<List<Map<String, dynamic>>> getShops() async {
  //   final response = await http.get(Uri.parse('https://api.example.com/shops'));
  //   return response.body as List<Map<String, dynamic>>;
  // }
  final CollectionReference shops = FirebaseFirestore.instance.collection('shop category request');
  Future<QuerySnapshot> getShops()async{

    QuerySnapshot querySnapshot = await shops.get();
    return querySnapshot;
  }
  Future<void>addShop(Shop shop)async{
    await shops.add(shop.toJson());
  }

  Future<String> uploadImage(File file) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('shops_images/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

}
