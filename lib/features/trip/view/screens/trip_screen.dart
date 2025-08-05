import 'package:_3la_ad_el_eed/core/services/service_locator.dart';
import 'package:_3la_ad_el_eed/features/trip/data/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit.dart';
import 'package:_3la_ad_el_eed/features/trip/view/widgets/trip_Screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TripCubit>(
      create: (_) => TripCubit(tripService<TripRepository>())..feachTripRoute(),

      child: TripScreenBody(),
    );
  }
}
