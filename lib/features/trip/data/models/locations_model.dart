import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationsModel {
  final double longitude;
  final double latitude;

  CurrentLocationsModel({required this.longitude, required this.latitude});

  factory CurrentLocationsModel.fromJson(Map<String, dynamic> data) {
    return CurrentLocationsModel(
      latitude: (data['latitude'] as num).toDouble(),
      longitude: (data['longitude'] as num).toDouble(),
    );
  }
  LatLng toLatLng() => LatLng(latitude, longitude);
}
