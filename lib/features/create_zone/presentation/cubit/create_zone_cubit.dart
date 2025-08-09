import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/repo/create_zone.dart';
import 'create_zone_state.dart';

class CreateZoneOnMapCubit extends Cubit<CreateZoneOnMapState> {
  CreateZoneOnMapCubit({required this.createZoneOnMapRepo})
    : super(const CreateZoneOnMapState());

  CreateZoneOnMapRepo createZoneOnMapRepo;

  Future<void> addZone({required data}) async {
    emit(state.copyWith(status: CreateZoneOnMapStatus.loading));
    try {
      await createZoneOnMapRepo.addZone(data: data);
      emit(state.copyWith(status: CreateZoneOnMapStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: CreateZoneOnMapStatus.error,
          error: error.toString(),
        ),
      );
    }
  }

  void createZone(String name, Color fillColor, Color strokeColor) {
    final points = state.polylinePoints;
    if (points.length < 3) return;

    final polygon = Polygon(
      polygonId: const PolygonId('zone_polygon'),
      points: points,
      fillColor: fillColor.withOpacity(0.3),
      strokeColor: strokeColor,
      strokeWidth: 1,
    );

    emit(state.copyWith(polygon: polygon, zoneName: name));
  }

  void updateMarkersAndPoints({
    required Set<Marker> markers,
    required List<LatLng> polylinePoints,
    Polygon? polygon,
  }) {
    emit(
      state.copyWith(
        markers: markers,
        polylinePoints: polylinePoints,
        polygon: polygon,
      ),
    );
  }

  void clearZones() {
    emit(const CreateZoneOnMapState());
  }
}
