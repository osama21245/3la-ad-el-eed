import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_product_remote_data_source.dart';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/add_produt_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add_product_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void intl() {
  //Shop
  sl.registerLazySingleton<ShopsRemoteDataSource>(
    () => ShopsRemoteDataSource(),
  );
  sl.registerLazySingleton<ShopsRepository>(
    () => ShopsRepository(remoteDataSource: sl<ShopsRemoteDataSource>()),
  );

  //Add product
  sl.registerLazySingleton<AddProductRemoteDataSource>(
    () => AddProductRemoteDataSourceImpl(
      firestore: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
    ),
  );
  sl.registerLazySingleton<AddProductRepository>(
    () => AddProductRepositoryImpl(
      addProductRemoteDataSource: sl<AddProductRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<AddProductCubit>(
    () => AddProductCubit(
      addProductRepository: sl<AddProductRepository>(),
      shopsRepository: sl<ShopsRepository>(),
    ),
  );
}
