//example
import 'dart:io';

import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:_3la_ad_el_eed/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class ShopsRemoteDataSource {

  final CollectionReference shopsRequests = FirebaseFirestore.instance.collection('shop category request');
  Future<QuerySnapshot> getShops()async{

    QuerySnapshot querySnapshot = await shopsRequests.get();
    return querySnapshot;
  }
  Future<DocumentSnapshot>getShopByID(String id)async{
    final querySnapShot = await shopsRequests.where('id',isEqualTo:id ).get();
    return querySnapShot.docs.first;
  }
  Future<void>addShop(Shop shop)async{
    await shopsRequests.add(shop.toJson());
  }

  Future<String> uploadImage(File file) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('shops_images/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void>acceptRequestStatus(Shop shop)async{
await shopsRequests.doc(shop.id).update({'requestStatus': 1});
  }

  Future<void>rejectRequestStatus(Shop shop,String adminMessage)async{
    await shopsRequests.doc(shop.id).update({'requestStatus': -1,'adminRejectionReasonMessage':adminMessage});
  }

}
