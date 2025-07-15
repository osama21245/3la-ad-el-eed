import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add_product_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import '../../features/shops/view/controllers/show_product_cubit.dart';

final sl = GetIt.instance;

void intl() {
  //Shop
  sl.registerLazySingleton<ShopsRemoteDataSource>(
    () => ShopsRemoteDataSourceImpl(
      firestore: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
    ),
  );
  sl.registerLazySingleton<ShopsRepository>(
    () => ShopsRepositoryImpl(remoteDataSource: sl<ShopsRemoteDataSource>()),
  );
  //Add product cubit
  sl.registerLazySingleton<AddProductCubit>(
    () => AddProductCubit(shopsRepository: sl<ShopsRepository>()),
  );
  //Show product cubit

  sl.registerLazySingleton<ShowProductCubit>(
    () => ShowProductCubit(shopRepository: sl<ShopsRepository>()),
  );
}
