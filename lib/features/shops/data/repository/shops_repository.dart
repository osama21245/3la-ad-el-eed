import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';

class ShopsRepository {
  final ShopsRemoteDataSource remoteDataSource;

  ShopsRepository({required this.remoteDataSource});

  Future<List<Shop>> getShops() async {
    final shops = await remoteDataSource.getShops();
    return shops.map((shop) => Shop.fromJson(shop)).toList();
  }
}
