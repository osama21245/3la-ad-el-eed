import 'package:_3la_ad_el_eed/features/trip/data/models/locations_model.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/trip_info_model.dart';
import 'package:_3la_ad_el_eed/features/trip/repository/trip_repository.dart';
import 'package:_3la_ad_el_eed/features/trip/view/controller/cubit/trip_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripCubitCubit extends Cubit<TripInfoState> {
  TripCubitCubit(this.tripRepository)
    : super(
        TripInfoState(
          status: TripInfoStatus.initial,
          locationsModel: LocationsModel(
            originLatitude: 30.0444,
            originLongitude: 31.2357,
            destinationLatitude: 29.9765,
            destinationLongitude: 31.1313,
          ),
          tripInfoModel: TripInfoModel(
            distanceText: "",
            distanceValue: 0,
            durationText: "",
            durationValue: 0,
          ),
        ),
      );

  final TripRepository tripRepository;
  String origin = "30.0444,31.2357";
  String destination = "29.9765,31.1313";

  Future<void> getTripInfo() async {
    LocationsModel locationModel = _getLatLng();
    emit(state.copyWith(status: TripInfoStatus.loading));

    try {
      TripInfoModel tripInfoModel = await tripRepository.getTripInfo(
        origin: origin,
        destination: destination,
      );

      emit(
        state.copyWith(
          status: TripInfoStatus.success,
          tripInfoModel: tripInfoModel,
          locationsModel: locationModel,
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

  LocationsModel _getLatLng() {
    return LocationsModel(
      originLatitude: double.parse(origin.split(',')[0]),
      originLongitude: double.parse(origin.split(',')[1]),
      destinationLatitude: double.parse(destination.split(',')[0]),
      destinationLongitude: double.parse(destination.split(',')[1]),
    );
  }
}
