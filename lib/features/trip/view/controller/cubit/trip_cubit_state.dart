import 'package:_3la_ad_el_eed/features/trip/data/models/locations_model.dart';
import 'package:_3la_ad_el_eed/features/trip/data/models/trip_info_model.dart';

enum TripInfoStatus { initial, loading, success, error }

extension TripInfoStateExtension on TripInfoState {
  bool get isInitial => status == TripInfoStatus.initial;
  bool get isLoading => status == TripInfoStatus.loading;
  bool get isSuccess => status == TripInfoStatus.success;
  bool get isError => status == TripInfoStatus.error;
}

final class TripInfoState {
  final TripInfoStatus status;
  final LocationsModel? locationsModel;
  final TripInfoModel? tripInfoModel;
  final String? errorMessage;

  TripInfoState({
    required this.status,
    this.locationsModel,
    this.errorMessage,
    this.tripInfoModel,
  });

  TripInfoState copyWith({
    TripInfoStatus? status,
    LocationsModel? locationsModel,
    TripInfoModel? tripInfoModel,
    String? errorMessage,
  }) {
    return TripInfoState(
      status: status ?? this.status,
      locationsModel: locationsModel ?? this.locationsModel,
      tripInfoModel: tripInfoModel ?? this.tripInfoModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
