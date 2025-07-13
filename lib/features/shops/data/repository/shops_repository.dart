import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:dartz/dartz.dart';

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
}
