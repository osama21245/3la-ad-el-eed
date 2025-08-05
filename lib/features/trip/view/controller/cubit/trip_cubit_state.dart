import 'package:_3la_ad_el_eed/features/trip/data/models/direction_route_moder.dart';

enum TripInfoStatus { initial, loading, success, error }

extension TripInfoStateExtension on TripInfoState {
  bool get isInitial => status == TripInfoStatus.initial;
  bool get isLoading => status == TripInfoStatus.loading;
  bool get isSuccess => status == TripInfoStatus.success;
  bool get isError => status == TripInfoStatus.error;
}

final class TripInfoState {
  final TripInfoStatus status;
  final DirectionModel directionModel;
  final String? errorMessage;

  TripInfoState({
    required this.status,
    this.errorMessage,
    required this.directionModel,
  });

  TripInfoState copyWith({
    TripInfoStatus? status,
    DirectionModel? directionModel,
    String? errorMessage,
  }) {
    return TripInfoState(
      status: status ?? this.status,
      directionModel: directionModel ?? this.directionModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
