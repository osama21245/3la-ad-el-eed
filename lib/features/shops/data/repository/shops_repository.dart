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
}
