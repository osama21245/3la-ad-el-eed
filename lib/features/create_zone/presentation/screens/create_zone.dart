import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubit/create_zone_cubit.dart';

class CreateZoneOnMapScreen extends StatefulWidget {
  const CreateZoneOnMapScreen({super.key});

  @override
  State<CreateZoneOnMapScreen> createState() => _CreateZoneOnMapScreenState();
}

class _CreateZoneOnMapScreenState extends State<CreateZoneOnMapScreen> {
  Set<Marker> markers = {};
  List<LatLng> polylinePoints = [];
  Polygon? polygon;
  String zoneName = '';
  final List<Color> zoneColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.brown,
  ];
  final Random random = Random();
  late BuildContext ctx;

  void _showMarkerDialog(LatLng markerPosition) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('What do you want?'),
          content: Text('Are you sure that you want to delete this marker?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  markers.removeWhere(
                    (marker) =>
                        marker.position.latitude == markerPosition.latitude &&
                        marker.position.longitude == markerPosition.longitude,
                  );
                  polygon = null;

                  polylinePoints = markers.map((m) => m.position).toList();
                });
                Navigator.pop(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showZoneNameDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Zone Name"),
          content: TextField(
            onChanged: (value) => zoneName = value,
            decoration: const InputDecoration(hintText: "Zone name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (zoneName.trim().isEmpty) return;
                _createZone(zoneName);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void _createZone(String zoneName) {
    final polygonId = 'zone_1';
    final color =
        (zoneColors[random.nextInt(zoneColors.length)] as MaterialColor)
            .shade400;

    setState(() {
      polygon = Polygon(
        polygonId: PolygonId(polygonId),
        points: List.from(polylinePoints),
        fillColor: color,
        strokeColor: Colors.black,
        strokeWidth: 1,
      );
    });
    _checkToEndZone();
  }

  void _clearZones() {
    setState(() {
      polygon = null;
      zoneName = '';
      polylinePoints.clear();
      markers.clear();
    });
  }

  void _checkToEndZone() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Zone created"),
          content: const Text("Do you want to modify this zone?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // يقفل Dialog بتاع السؤال

                final zoneData = {
                  'name': zoneName,
                  'points':
                      polylinePoints
                          .map((p) => {'lat': p.latitude, 'lng': p.longitude})
                          .toList(),
                };
                context.read<CreateZoneOnMapCubit>().fetchZone(data: zoneData);
                BuildContext? dialogContext;

                // Show success dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (ctx) {
                    dialogContext = ctx;
                    return const AlertDialog(
                      alignment: Alignment.center,
                      content: Text(
                        'Zone Created Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green),
                      ),
                    );
                  },
                );
                await Future.delayed(const Duration(seconds: 1));

                // اقفل الـ dialog
                if (dialogContext != null) {
                  Navigator.pop(dialogContext!);
                }

                _clearZones();

                // اقفل شاشة الخريطة نفسها
               //TODO:  Navigator.pop(ctx);
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext screenContext) {
    ctx = screenContext;
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(29.9765, 31.1313),
        zoom: 9,
      ),
      markers: markers,
      polygons: polygon != null ? {polygon!} : {},
      onTap: (LatLng tappedPoint) {
        if (polygon != null) return;
        final newMarker = Marker(
          markerId: MarkerId(
            "marker_${tappedPoint.latitude}_${tappedPoint.longitude}",
          ),
          position: tappedPoint,
          onTap: () {
            _showMarkerDialog(tappedPoint);
          },
        );

        setState(() {
          markers.add(newMarker);
          polylinePoints.add(tappedPoint);

          if (polylinePoints.length >= 3) {
            _showZoneNameDialog();
          }
        });
      },
    );
  }
}
