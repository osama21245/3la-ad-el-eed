
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/shop.dart';
import '../../../data/repository/shops_repository.dart';
import 'add_shop_state.dart';


class AddShopCubit extends Cubit<AddShopState> {
  final ShopsRepository shopsRepository;

  AddShopCubit({required this.shopsRepository}) : super(AddShopState.initial());

  Future<void> addShop(Shop shop) async {
    emit(state.copyWith(status: AddShopStatus.loading));
    final result =await shopsRepository.addShop(shop);
    result.fold(
          (failure) => emit(
        state.copyWith(
          status: AddShopStatus.error,
          errorMessage: failure,
        ),
      ),
          (_) => emit(state.copyWith(status: AddShopStatus.success)),
    );
  }

  void reset() {
    emit(AddShopState.initial());
  }
}