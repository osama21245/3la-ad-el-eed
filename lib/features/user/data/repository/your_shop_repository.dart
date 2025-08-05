

import 'dart:io';

import 'package:dartz/dartz.dart';

import '../data_source/your_shop_remote_datasource.dart';
import '../models/shop.dart';

class YourShopRepository {
  final YourShopRemoteDataSource yourShopRemoteDataSource;

  YourShopRepository({required this.yourShopRemoteDataSource});

  Future<Either<String, Shop>> getYourShop() async {
    try {
      final snapshot = await yourShopRemoteDataSource.getYourShop();

       Shop yourShop=  Shop.fromJson(snapshot.data() as Map<String, dynamic>);

      return right(yourShop);
    } on Exception catch (e) {
      print(e);
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> addYourShop(Shop shop,String category) async {
    try {
      await yourShopRemoteDataSource.addYourShop(shop, category);
      return right(unit);
    } catch (e) {
      print("Add failed: $e");
      return left(e.toString());
    }
  }

  Future<Either<String,String>> uploadImage(File file) async {
    try {
      return right(await yourShopRemoteDataSource.uploadImage(file));
    }
    catch (e) {
      return left("Image upload failed: $e");
    }
  }
  Future<Either<String,Unit>>deleteYourRejectedRequest(Shop shop)async{
    try {
      await yourShopRemoteDataSource.deleteYourRejectedRequest(shop);
      return right(unit);
    } on Exception catch (e) {
  return left(e.toString());
    }
  }

}
