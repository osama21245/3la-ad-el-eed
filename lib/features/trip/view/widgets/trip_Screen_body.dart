import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_cubit.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_state.dart';
import 'package:_3la_ad_el_eed/features/trip/view/widgets/trip_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripScreenBody extends StatelessWidget {
  const TripScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip details', style: TextStyle(color: Colors.blue[700])),
        centerTitle: true,
      ),
      body: BlocBuilder<TripCubitCubit, TripInfoState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(29.9765, 31.1313),
                  zoom: 9,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(" 1"),
                    position: LatLng(30.033333, 31.233334),
                    infoWindow: InfoWindow(
                      title: 'shop location',
                      snippet: 'shop name',
                    ),
                  ),
                  Marker(
                    markerId: MarkerId(" 2"),
                    position: LatLng(29.960000, 31.280000),
                    infoWindow: InfoWindow(title: "client location"),
                  ),
                },
              ),
              TripInfoWidget(
                distance: "distance:${state.tripInfoModel!.distanceText}",
                distanceIcon: Icons.route,
                duration: "duration:${state.tripInfoModel!.durationText}",
                durationIcon: Icons.access_time,
              ),
            ],
          );
        },
      ),
    );
  }
}
