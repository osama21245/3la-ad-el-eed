import 'dart:io';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_shop_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:dartz/dartz.dart';

class AddShopRepository {
  final AddShopRemoteDatasource remoteDataSource;

  AddShopRepository({required this.remoteDataSource});

  Future<Either<String, Unit>> addShop(Shop shop) async {
    try {
      await remoteDataSource.addShop(shop: shop);
      return right(unit);
    } catch (e) {
      print("Add failed: $e");
      return left(e.toString());
    }
  }

  Future<Either<String, String>> uploadImage(File file) async {
    try {
      return right(await remoteDataSource.uploadImage(file));
    } catch (e) {
      return left("Image upload failed: $e");
    }
  }

  Future<List<Shop>> getShops() async {
    final shops = await remoteDataSource.getShops();
    return shops.map((shop) => Shop.fromJson(shop)).toList();
  }
}
