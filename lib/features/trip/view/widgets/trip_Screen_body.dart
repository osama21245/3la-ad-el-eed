import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_cubit.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_state.dart';
import 'package:_3la_ad_el_eed/features/trip/view/widgets/google_map_widget.dart';
import 'package:_3la_ad_el_eed/features/trip/view/widgets/trip_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          final tripCubit = context.read<TripCubitCubit>();
          return Stack(
            children: [
              GoogleMapWidget(
                origin: tripCubit.getLatLng(tripCubit.origin),
                destination: tripCubit.getLatLng(tripCubit.destination),
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
