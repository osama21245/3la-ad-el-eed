import 'package:_3la_ad_el_eed/features/trip/data/data_source/network_info.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/trip_info_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/trip/repository/trip_repository.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final tripService = GetIt.instance;

void setupServiceLocator() {
  // Inject DataSource
  tripService.registerLazySingleton<TripInfoRemoteDatasource>(
    () => TripInfoRemoteDatasource(),
  );

  // Inject Repository
  tripService.registerLazySingleton<TripRepository>(
    () => TripRepository(
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      tripInfoRemoteDatasource: tripService<TripInfoRemoteDatasource>(),
    ),
  );
}
