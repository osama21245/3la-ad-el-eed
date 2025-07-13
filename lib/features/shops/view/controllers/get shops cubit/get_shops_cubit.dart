import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'get_shops_state.dart';

class GetShopsCubit extends Cubit<GetShopsState> {
  final ShopsRepository shopsRepository;

  GetShopsCubit({required this.shopsRepository})
      : super(GetShopsState(status: GetShopsStatus.initial));

  Future<void> getShops() async {
    emit(state.copyWith(status: GetShopsStatus.loading));

    final result = await shopsRepository.getShops();

    result.fold(
          (failure) => emit(
        state.copyWith(
          status: GetShopsStatus.error,
          error: failure,
        ),
      ),
          (shops) => emit(
        state.copyWith(
          status: GetShopsStatus.success,
          shops: shops,
        ),
      ),
    );
  }
}
