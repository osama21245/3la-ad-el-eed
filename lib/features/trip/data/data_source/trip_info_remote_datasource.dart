import 'package:dio/dio.dart';

class TripInfoRemoteDatasource {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://maps.googleapis.com/maps/api/distancematrix/json";
  final String _apiKey = "AIzaSyBEBg6ItImxrxhsGbv7G9KNyvy1gr2MGwo";

  Future<Map<String, dynamic>> getTripInfo({
    required String origin,
    required String destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        "origins": origin,
        "destinations": destination,
        "key": _apiKey,
      },
    );

    return response.data as Map<String, dynamic>;
  }
}
