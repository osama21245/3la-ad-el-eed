import 'package:_3la_ad_el_eed/features/admin/data/data_source/user_remote_data_source.dart';
import 'package:_3la_ad_el_eed/features/admin/data/repository/user_repository.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/block_user_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_products_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/add_products_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add_product_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import '../../features/shops/view/controllers/show_product_cubit.dart';

final sl = GetIt.instance;

void intl() {
  //Shop
  sl.registerLazySingleton<AddProductsRemoteDatasource>(
    () => AddProductsRemoteDatasourceImpl(
      firestore: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
    ),
  );
  sl.registerLazySingleton<AddProductsRepository>(
    () => AddProductsRepositoryImpl(remoteDataSource: sl<AddProductsRemoteDatasource>()),
  );
  //Add product cubit
  sl.registerLazySingleton<AddProductCubit>(
    () => AddProductCubit(shopsRepository: sl<AddProductsRepository>()),
  );
  //Show product cubit
  sl.registerLazySingleton<ShowProductCubit>(
    () => ShowProductCubit(shopRepository: sl<AddProductsRepository>()),
  );
  //User
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(firestore: FirebaseFirestore.instance),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl<UserRemoteDataSource>()),
  );
  sl.registerLazySingleton<BlockUserCubit>(
    () => BlockUserCubit(userRepository: sl<UserRepository>()),
  );
}
