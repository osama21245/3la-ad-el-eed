import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit.dart';
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
      appBar: tripAppBar(),
      body: BlocBuilder<TripCubit, TripInfoState>(
        builder: (context, state) {
          return state.isSuccess
              ? Stack(
                children: [
                  GoogleMapWidget(directionModel: state.directionModel),

                  TripInfoWidget(
                    distance:
                        "distance\n ${state.directionModel.totalDistance}",
                    distanceIcon: Icons.route,
                    duration:
                        "duration\n ${state.directionModel.totalDuration}",
                    durationIcon: Icons.access_time,
                  ),
                ],
              )
              : Container();
        },
      ),
    );
  }
}

AppBar tripAppBar() {
  return AppBar(
    title: Text('Trip details', style: TextStyle(color: Colors.blue[700])),
    centerTitle: true,
  );
}
