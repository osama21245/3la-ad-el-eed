import 'package:_3la_ad_el_eed/core/connection/network_info.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/direction_api_data.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/firebase_services.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/direction_route_moder.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/locations_model.dart';

class TripRepository {
  final FirebaseLocationService firebaseLocationService;
  final TripDirectionRemoteData tripDirectionRemoteData;
  final NetworkInfo networkInfo;
  TripRepository({
    required this.firebaseLocationService,
    required this.networkInfo,
    required this.tripDirectionRemoteData,
  });

  Future<Map<String, dynamic>> _fetchRoute({
    required String origin,
    required String destination,
  }) async {
    final bool isConnected = await networkInfo.isConnected!;
    if (!isConnected) {
      throw Exception("تحقق من الاتصال بشبكة الإنترنت");
    }
    final tripInfo = await tripDirectionRemoteData.fetchRoute(
      origin: origin,
      destination: destination,
    );

    return tripInfo;
  }

  Future<DirectionModel> fetchRoute({
    required String origin,
    required String destination,
  }) async {
    final info = await _fetchRoute(origin: origin, destination: destination);

    return DirectionModel.fromJson(info);
  }

  Stream<Map<String, dynamic>> _listenToDriverLocation({
    required String driverId,
  }) {
    return firebaseLocationService.listenToDriverLocation(driverId: driverId);
  }

  Stream<CurrentLocationsModel> listenToDriverLocation({
    required String driverId,
  }) {
    return _listenToDriverLocation(
      driverId: driverId,
    ).map((data) => CurrentLocationsModel.fromJson(data));
  }
}
