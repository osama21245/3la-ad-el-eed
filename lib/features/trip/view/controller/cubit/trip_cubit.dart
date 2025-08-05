import 'dart:async';
import 'package:_3la_ad_el_eed/features/trip/data/models/direction_route_moder.dart';
import 'package:_3la_ad_el_eed/features/trip/data/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripCubit extends Cubit<TripInfoState> {
  TripCubit(this.tripRepository)
    : super(
        TripInfoState(
          status: TripInfoStatus.initial,
          directionModel: DirectionModel.empty(),
        ),
      );

  final TripRepository tripRepository;

  String origin = "30.073338, 31.278424";
  String destination = "30.115292, 31.340199";

  Future<void> feachTripRoute() async {
    emit(state.copyWith(status: TripInfoStatus.loading));

    try {
      DirectionModel directionModel = await tripRepository.fetchRoute(
        origin: origin,

        destination: destination,
      );
      emit(
        state.copyWith(
          status: TripInfoStatus.success,
          directionModel: directionModel,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TripInfoStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
