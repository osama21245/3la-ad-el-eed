 add_product
import 'dart:io';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';

abstract class ShopsRepository {
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

class ShopsRepositoryImpl implements ShopsRepository {
  ShopsRemoteDataSource remoteDataSource;
  ShopsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
    required String shopId,
    required String userId,
  }) {
    return remoteDataSource.addProduct(
      name: name,
      description: description,
      price: price,
      imageFile: imageFile,
      shopId: shopId,
      userId: userId,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> fetchProducts() {
    return remoteDataSource.fetchProducts();
  }

 add_shop
import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
 development

class ShopsRepository {
  final ShopsRemoteDataSource remoteDataSource;

  ShopsRepository({required this.remoteDataSource});

 add_shop

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



  Future<List<Shop>> getShops() async {
    final shops = await remoteDataSource.getShops();
    return shops.map((shop) => Shop.fromJson(shop)).toList();
  }
 development
 development
}
