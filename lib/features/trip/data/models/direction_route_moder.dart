import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionModel {
  late LatLngBounds bounds;
  late List<PointLatLng> polylinePoints;
  late String totalDistance;
  late String totalDuration;

  DirectionModel({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory DirectionModel.fromJson(Map<String, dynamic> data) {
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    late String distance;
    late String duration;
    final legs = data['legs'] as List;

    if (legs.isNotEmpty) {
      final leg = legs[0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return DirectionModel(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(
        data['overview_polyline']['points'],
      ),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
  static DirectionModel empty() {
    return DirectionModel(
      bounds: LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0)),
      totalDistance: "0",
      totalDuration: "0",
      polylinePoints: List.empty(),
    );
  }
}
