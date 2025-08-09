import 'dart:math';
import 'package:_3la_ad_el_eed/features/create_zone/data/repo/create_zone.dart';
import 'package:_3la_ad_el_eed/features/create_zone/presentation/cubit/create_zone_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubit/create_zone_cubit.dart';

class CreateZoneOnMapScreen extends StatefulWidget {
  const CreateZoneOnMapScreen({super.key, required CreateZoneOnMapRepo createZoneOnMapRepo});

  @override
  State<CreateZoneOnMapScreen> createState() => _CreateZoneOnMapScreenState();
}

class _CreateZoneOnMapScreenState extends State<CreateZoneOnMapScreen> {
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
  late Color color;

  @override
  void initState() {
    super.initState();
    color =
        (zoneColors[random.nextInt(zoneColors.length)] as MaterialColor)
            .shade400;
  }

  void _showMarkerDialog(LatLng markerPosition) {
    final cubit = context.read<CreateZoneOnMapCubit>();
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
                final updatedMarkers = Set<Marker>.from(cubit.state.markers)
                  ..removeWhere(
                    (marker) =>
                        marker.position.latitude == markerPosition.latitude &&
                        marker.position.longitude == markerPosition.longitude,
                  );

                final updatedPoints = List<LatLng>.from(
                  updatedMarkers.map((m) => m.position),
                );

                cubit.updateMarkersAndPoints(
                  markers: updatedMarkers,
                  polylinePoints: updatedPoints,
                  polygon: null,
                );
                Navigator.pop(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showZoneNameDialog(BuildContext screenContext) {
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
                final cubit = context.read<CreateZoneOnMapCubit>();
                cubit.createZone(zoneName, color, Colors.black);
                _showEndZoneDialog(context, zoneName);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void _showEndZoneDialog(BuildContext context, String zoneName) {
    final cubit = context.read<CreateZoneOnMapCubit>();

    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text("Zone Created"),
            content: const Text("Do you want to modify this zone?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close dialog
                  cubit.updateMarkersAndPoints(
                    markers: cubit.state.markers,
                    polylinePoints: cubit.state.polylinePoints,
                    polygon: null,
                  );
                }, // Stay on map
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close dialog
                  final zoneData = {
                    'name': zoneName,
                    'points':
                        cubit.state.polylinePoints
                            .map((p) => {'lat': p.latitude, 'lng': p.longitude})
                            .toList(),
                  };
                  cubit.addZone(data: zoneData);
                  cubit.clearZones();
                },
                child: const Text("No"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext screenContext) {
    return BlocConsumer<CreateZoneOnMapCubit, CreateZoneOnMapState>(
      listener: (context, state) {
        if (state.status == CreateZoneOnMapStatus.success) {
          // Show success dialog
          showDialog(
            context: context,
            builder: (ctx) {
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(ctx).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back
              });
              return const AlertDialog(
                content: Text(
                  'Zone Created Successfully',
                  style: TextStyle(color: Colors.green),
                ),
              );
            },
          );
        }

        if (state.status == CreateZoneOnMapStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(29.9765, 31.1313),
            zoom: 9,
          ),
          markers: state.markers,
          polygons: state.polygon != null ? {state.polygon!} : {},
          onTap: (LatLng tappedPoint) {
            if (state.polygon != null) return;
            final newMarker = Marker(
              markerId: MarkerId(
                "marker_${tappedPoint.latitude}_${tappedPoint.longitude}",
              ),
              position: tappedPoint,
              onTap: () {
                _showMarkerDialog(tappedPoint);
              },
            );
            final newMarkers = Set<Marker>.from(state.markers)..add(newMarker);
            final newPoints = List<LatLng>.from(state.polylinePoints)
              ..add(tappedPoint);

            context.read<CreateZoneOnMapCubit>().updateMarkersAndPoints(
              markers: newMarkers,
              polylinePoints: newPoints,
            );

            if (newPoints.length >= 3) {
              _showZoneNameDialog(context);
            }
          },
        );
      },
    );
  }
}
