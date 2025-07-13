import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_product_remote_data_source.dart';

abstract class AddProductRepository {
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  });
}

class AddProductRepositoryImpl implements AddProductRepository {
  final AddProductRemoteDataSource addProductRemoteDataSource;

  AddProductRepositoryImpl({required this.addProductRemoteDataSource});
  @override
  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageFile,
  }) {
    return addProductRemoteDataSource.addProduct(
      name: name,
      description: description,
      price: price,
      imageFile: imageFile,
    );
  }
}
