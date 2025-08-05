import 'package:_3la_ad_el_eed/core/services/service_locator.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/direction_route_moder.dart';
import 'package:_3la_ad_el_eed/features/trip/data/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/value_notifier/trip_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final DirectionModel directionModel;
  const GoogleMapWidget({super.key, required this.directionModel});

  @override
  State<GoogleMapWidget> createState() => _DriverTrackingPageState();
}

class _DriverTrackingPageState extends State<GoogleMapWidget> {
  DriverTrackingManager? manager;
  @override
  void initState() {
    super.initState();

    manager = DriverTrackingManager(
      directionModel: widget.directionModel,
      tripRepository: tripService<TripRepository>(),
    );
    manager!.getAllRoutePoints();
  }

  @override
  void dispose() {
    manager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<LatLng>(
      valueListenable: manager!.currentPosition,
      builder: (context, currentPosition, _) {
        return Stack(
          children: [
            GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              scrollGesturesEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              initialCameraPosition: manager!.initialLocation,
              onMapCreated: (controller) {
                manager!.setMapController(controller);
              },
              markers: {
                Marker(
                  markerId: MarkerId("target"),
                  position:
                      manager!.routePoints.isEmpty
                          ? LatLng(0, 0)
                          : manager!.routePoints[manager!.routePoints.length -
                              1],

                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
                Marker(
                  markerId: MarkerId("currentPoint"),

                  // rotation: manager!.headingAngle,
                  position: currentPosition,

                  // anchor: Offset(0.5, 0.5),
                  // flat: true,
                  icon:
                  //manager!.driverIcon ??
                  //  manager.driverIcon!,
                  BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId("actual_route"),

                  points: manager!.routePoints,
                  color: Colors.red,
                  width: 7,
                ),
                Polyline(
                  polylineId: PolylineId("current_route"),
                  points: manager!.currentroutePoints,
                  color: Colors.green,
                  width: 7,
                ),
              },
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  manager!.startSimulation();
                },
                child: Text("Start"),
              ),
            ),
          ],
        );
      },
    );
  }
}
