import 'package:_3la_ad_el_eed/features/trip/data/models/trip_info_model.dart';
import 'package:_3la_ad_el_eed/features/trip/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripCubitCubit extends Cubit<TripInfoState> {
  TripCubitCubit(this.tripRepository)
    : super(
        TripInfoState(
          status: TripInfoStatus.initial,

          tripInfoModel: TripInfoModel.empty(),
        ),
      );

  final TripRepository tripRepository;
  String origin = "30.033333, 31.233334";
  String destination = "29.960000, 31.280000";

  Future<void> getTripInfo(Set<Polyline> polyline) async {
    emit(state.copyWith(status: TripInfoStatus.loading));

    try {
      TripInfoModel tripInfoModel = await tripRepository.getTripInfo(
        origin: origin,
        destination: destination,
      );
      drawPolyLine(polyline);
      emit(
        state.copyWith(
          status: TripInfoStatus.success,
          tripInfoModel: tripInfoModel,
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

  LatLng getLatLng(String point) {
    final parts = point.split(',');
    return LatLng(double.parse(parts[0]), double.parse(parts[1]));
  }

  void drawPolyLine(Set<Polyline> polyline) {
    polyline.add(
      Polyline(
        color: Colors.blue,
        polylineId: PolylineId("route"),
        width: 4,
        points: [getLatLng(origin), getLatLng(destination)],
      ),
    );
  }
}
