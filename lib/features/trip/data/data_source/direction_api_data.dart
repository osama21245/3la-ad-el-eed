import 'package:_3la_ad_el_eed/core/utils/app_strings.dart';
import 'package:dio/dio.dart';

class TripDirectionRemoteData {
  final Dio _dio = Dio();
  // final String _apiKey = GoggleMapApiStrings.ApiKey;
  // final departureTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  Future<Map<String, dynamic>> fetchRoute({
    required String origin,
    required String destination,
  }) async {
    final String url = GoggleMapApiStrings.getRouteUrl;

    final response = await _dio.get(
      url,
      queryParameters: {
        GoggleMapApiStrings.origin: origin,
        GoggleMapApiStrings.destination: destination,
        // GoggleMapApiStrings.key: _apiKey,
      },
    );

    return response.data['routes'][0] as Map<String, dynamic>;
  }
}
