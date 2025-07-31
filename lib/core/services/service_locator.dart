import 'package:_3la_ad_el_eed/core/connection/network_info.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/direction_api_data.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/firebase_services.dart';
import 'package:_3la_ad_el_eed/features/trip/data/repository/trip_repository.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

final tripService = GetIt.instance;

void setupServiceLocator() {
  tripService.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );
  tripService.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(tripService()),
  );

  // Data sources
  tripService.registerLazySingleton<TripDirectionRemoteData>(
    () => TripDirectionRemoteData(),
  );

  // Services
  tripService.registerLazySingleton<FirebaseLocationService>(
    () => FirebaseLocationService(),
  );

  // Repository
  tripService.registerLazySingleton<TripRepository>(
    () => TripRepository(
      networkInfo: tripService(),
      tripDirectionRemoteData: tripService(),
      firebaseLocationService: tripService(),
    ),
  );
}
