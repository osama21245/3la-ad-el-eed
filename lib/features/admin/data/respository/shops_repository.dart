import 'dart:io';

import 'package:_3la_ad_el_eed/features/admin/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ShopsRepository {
  final ShopsRemoteDataSource remoteDataSource;

  ShopsRepository({required this.remoteDataSource});

  Future<Either<String, List<Shop>>> getShops() async {
    try {
      final snapshot = await remoteDataSource.getShops();
      List<Shop> shops = [];
      for (var doc in snapshot.docs) {
        shops.add(Shop.fromJson(doc.data() as Map<String, dynamic>));
      }
      return right(shops);
    } on Exception catch (e) {
      print(e);
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> addShop(Shop shop) async {
    try {
      await remoteDataSource.addShop(shop);
      return right(unit);
    } catch (e) {
      print("Add failed: $e");
      return left(e.toString());
    }
  }

  Future<Either<String,String>> uploadImage(File file) async {
    try {
    return right(await remoteDataSource.uploadImage(file));
    }
    catch (e) {
      return left("Image upload failed: $e");
    }
  }
Future<Either<String,Unit>>acceptRequestStatus(Shop shop)async{
    try {
      await remoteDataSource.acceptRequestStatus(shop);
      return right(unit);
    } on Exception catch (e) {
      return left(e.toString());
    }

}

  Future<Either<String,Unit>>rejectRequestStatus(Shop shop,String adminMessage)async{
    try {
      await remoteDataSource.rejectRequestStatus(shop, adminMessage);
      return right(unit);
    } on Exception catch (e) {
      return left(e.toString());
    }

  }
  Future<Either<String,Shop>>getShopByID(String id)async{
    try {
      final snapShot = await remoteDataSource.getShopByID(id);
     Shop shop = Shop.fromJson(snapShot.data() as Map<String ,dynamic>);
      return right(shop);
    } on Exception catch (e) {
return left(e.toString());
    }

  }
}
