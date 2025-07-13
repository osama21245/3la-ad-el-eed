import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final LatLng origin;
  final LatLng destination;

  const GoogleMapWidget({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(29.9765, 31.1313),
        zoom: 9,
      ),
      markers: {
        customMarker(
          markerId: "1",
          position: origin,
          title: 'shop location',
          snippet: 'shop name',
        ),
        customMarker(
          markerId: "2",
          position: destination,
          title: "client location",
          snippet: 'client',
        ),
      },
      polylines: {
        Polyline(
          color: Colors.blue,
          polylineId: PolylineId("route"),
          width: 7,
          points: [origin, destination],
        ),
      },
    );
  }
}

Marker customMarker({
  LatLng? position,
  required String markerId,
  String? title,
  String? snippet,
}) {
  return Marker(
    markerId: MarkerId(markerId),
    position: position!,

    infoWindow: InfoWindow(title: title, snippet: snippet),
  );
}
