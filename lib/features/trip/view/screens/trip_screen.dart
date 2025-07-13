import 'package:_3la_ad_el_eed/core/service_locator.dart';
import 'package:_3la_ad_el_eed/features/trip/repository/trip_repository.dart'
    show TripRepository;
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_cubit.dart';
import 'package:_3la_ad_el_eed/features/trip/view/widgets/trip_Screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripScreen extends StatelessWidget {
  TripScreen({super.key});

  // final Set<Polyline> _polyline = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TripCubitCubit>(
      create:
          (_) => TripCubitCubit(tripService<TripRepository>())..getTripInfo(),
      child: Scaffold(appBar: tripAppBar(), body: TripScreenBody()),
    );
  }
}

AppBar tripAppBar() {
  return AppBar(
    title: Text('Trip details', style: TextStyle(color: Colors.blue[700])),
    centerTitle: true,
  );
}
