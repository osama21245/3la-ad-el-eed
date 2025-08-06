import 'package:google_maps_flutter/google_maps_flutter.dart';

enum CreateZoneOnMapStatus { initial, loading, success, error }

class CreateZoneOnMapState {
  final CreateZoneOnMapStatus status;
  final String? error;
  final Set<Marker> markers;
  final List<LatLng> polylinePoints;
  final Polygon? polygon;
  final String? zoneName;

  const CreateZoneOnMapState({
    this.status = CreateZoneOnMapStatus.initial,
    this.error,
    this.markers = const {},
    this.polylinePoints = const [],
    this.polygon,
    this.zoneName,
  });

  CreateZoneOnMapState copyWith({
    CreateZoneOnMapStatus? status,
    String? error,
    Set<Marker>? markers,
    List<LatLng>? polylinePoints,
    Polygon? polygon,
    String? zoneName,
  }) {
    return CreateZoneOnMapState(
      status: status ?? this.status,
      error: error ?? this.error,
      markers: markers ?? this.markers,
      polylinePoints: polylinePoints ?? this.polylinePoints,
      polygon: polygon,
      zoneName: zoneName ?? this.zoneName,
    );
  }
}
