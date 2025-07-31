// Name has "2" to avoid git conflict
import 'package:_3la_ad_el_eed/features/shops/data/data_source/map_data_source.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/map_repo.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> diInit() async {
  sl.registerSingleton(MapDataSourceImpl());
  sl.registerLazySingleton(() => MapRepoImpl(mapDataSource: sl<MapDataSourceImpl>()));
  sl.registerFactory(() => ShopLocationCubit(sl<MapRepoImpl>()));
}
