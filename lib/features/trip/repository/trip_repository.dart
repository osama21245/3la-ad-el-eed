import 'package:_3la_ad_el_eed/features/trip/data/data_source/network_info.dart';
import 'package:_3la_ad_el_eed/features/trip/data/data_source/trip_info_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/trip_info_model.dart';

class TripRepository {
  final TripInfoRemoteDatasource tripInfoRemoteDatasource;
  final NetworkInfo networkInfo;
  TripRepository({
    required this.networkInfo,
    required this.tripInfoRemoteDatasource,
  });
  Future<Map<String, dynamic>> _getTripInfo({
    required String origin,
    required String destination,
  }) async {
    final bool isConnected = await networkInfo.isConnected!;
    if (!isConnected) {
      throw Exception("تحقق من الاتصال بشبكة الإنترنت");
    }
    final tripInfo = await tripInfoRemoteDatasource.getTripInfo(
      origin: origin,
      destination: destination,
    );

    return tripInfo;
  }

  Future<TripInfoModel> getTripInfo({
    required String origin,
    required String destination,
  }) async {
    final info = await _getTripInfo(origin: origin, destination: destination);

    return TripInfoModel.fromJson(info);
  }
}
