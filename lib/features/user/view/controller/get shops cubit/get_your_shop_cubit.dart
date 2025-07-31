

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/your_shop_repository.dart';
import 'get_your_shop_state.dart';

class GetYourShopCubit extends Cubit<GetYourShopState> {
  final YourShopRepository yourShopRepository;

  GetYourShopCubit({required this.yourShopRepository})
      : super(GetYourShopState(status: GetYourShopStatus.initial));

  Future<void> getYourShop() async {
    emit(state.copyWith(status: GetYourShopStatus.loading));

    final result = await yourShopRepository.getYourShop();

    result.fold(
          (failure) => emit(
        state.copyWith(
          status: GetYourShopStatus.error,
          error: failure,
        ),
      ),
          (yourShop) => emit(
        state.copyWith(
          status: GetYourShopStatus.success,
          yourShop: yourShop,
        ),
      ),
    );
  }
}
