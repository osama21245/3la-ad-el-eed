import 'package:bloc/bloc.dart';

import '../../data/repo/create_zone.dart';
import 'create_zone_state.dart';

class CreateZoneOnMapCubit extends Cubit<CreateZoneOnMapState> {
  CreateZoneOnMapCubit({required this.createZoneOnMapRepo})
    : super(CreateZoneOnMapState.initial());

  CreateZoneOnMapRepo createZoneOnMapRepo;

  Future<void> fetchZone({required data}) async {
    emit(state.copyWith(status: CreateZoneOnMapStatus.loading));
    try {
      await createZoneOnMapRepo.fetchZone(data: data);
      emit(state.copyWith(status: CreateZoneOnMapStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: CreateZoneOnMapStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
