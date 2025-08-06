enum CreateZoneOnMapStatus { initial, loading, success, error }

extension CreateZoneOnMapExtention on CreateZoneOnMapState {
  bool get isInitial => state == CreateZoneOnMapStatus.initial;
  bool get isLoading => state == CreateZoneOnMapStatus.loading;
  bool get isSuccess => state == CreateZoneOnMapStatus.success;
  bool get isError => state == CreateZoneOnMapStatus.error;
}

class CreateZoneOnMapState {
  final CreateZoneOnMapStatus state;
  final String? error;

  CreateZoneOnMapState({required this.state, this.error});

  factory CreateZoneOnMapState.initial() {
    return CreateZoneOnMapState(
      state: CreateZoneOnMapStatus.initial,
      error: '',
    );
  }

  CreateZoneOnMapState copyWith({
    CreateZoneOnMapStatus? status,
    String? errorMessage,
  }) {
    return CreateZoneOnMapState(
      state: status ?? state,
      error: errorMessage ?? error,
    );
  }
}
