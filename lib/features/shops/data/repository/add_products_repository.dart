import 'dart:io';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_products_remote_datasource.dart';

abstract class AddProductsRepository {
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

class AddProductsRepositoryImpl implements AddProductsRepository {
  AddProductsRemoteDatasource remoteDataSource;
  AddProductsRepositoryImpl({required this.remoteDataSource});
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
