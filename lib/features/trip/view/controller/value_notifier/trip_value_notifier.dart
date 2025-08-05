import 'dart:async';
import 'dart:math';
import 'package:_3la_ad_el_eed/features/trip/data/models/direction_route_moder.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/locations_model.dart';
import 'package:_3la_ad_el_eed/features/trip/data/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/functions/get_marker_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverTrackingManager {
  final DirectionModel directionModel;
  final TripRepository tripRepository;
  DriverTrackingManager({
    required this.tripRepository,
    required this.directionModel,
  });

  ValueNotifier<LatLng> currentPosition = ValueNotifier(LatLng(0, 0));

  final ValueNotifier<CameraPosition> cameraPosition = ValueNotifier(
    CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 16),
  );
  GoogleMapController? mapController;
  StreamSubscription<CurrentLocationsModel>? _subscription;

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  BitmapDescriptor? driverIcon;

  List<LatLng> routePoints = [];
  List<LatLng> currentroutePoints = [];

  final CameraPosition initialLocation = CameraPosition(
    target: LatLng(30.0710, 31.2800),
    zoom: 11,
  );
  Future<void> loadDriverIcon() async {
    final imageBytes = await getMarker();
    driverIcon = BitmapDescriptor.bytes(imageBytes);
  }

  void getAllRoutePoints() async {
    var response = directionModel;

    List<PointLatLng> result = response.polylinePoints;

    routePoints =
        result.map((point) => LatLng(point.latitude, point.longitude)).toList();
    mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(response.bounds, 15),
    );
    await loadDriverIcon();
  }

  void startSimulation() async {
    if (routePoints.isEmpty) {
      return;
    }
    startListening("d123");

    for (int i = 0; i < routePoints.length; i++) {
      i != 0
          ? previousPosition = routePoints[i - 1]
          : previousPosition = routePoints[i];

      await Future.delayed(Duration(seconds: 1));
      if (i < 10) {
        mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(routePoints[i], 15),
        );
      }

      currentroutePoints.add(routePoints[i]);
      await updateDriverCurrentLocations(
        driverId: 'd123',
        currentPoint: routePoints[i],
      );
    }
  }

  LatLng previousPosition = LatLng(0, 0);

  double calculateRotation(LatLng end) {
    final dx = end.longitude - previousPosition.longitude;
    final dy = end.latitude - previousPosition.latitude;
    final angle = atan2(dy, dx) * (180 / pi);
    // return (angle + 360) % 360;
    return angle;
  }

  Future<void> updateDriverCurrentLocations({
    required String driverId,
    required LatLng currentPoint,
  }) async {
    await FirebaseFirestore.instance.collection('drivers').doc(driverId).set({
      'latitude': currentPoint.latitude,
      'longitude': currentPoint.longitude,
    });
  }

  double headingAngle = 0;

  void dispose() {
    currentPosition.dispose();
    cameraPosition.dispose();
    mapController!.dispose();
    _subscription!.cancel();
  }

  void startListening(String driverId) {
    _subscription = tripRepository
        .listenToDriverLocation(driverId: driverId)
        .listen(
          (newPosition) {
            currentPosition.value = newPosition.toLatLng();
          },
          onError: (_) {
            currentPosition.value = previousPosition;
          },
        );
  }
}
