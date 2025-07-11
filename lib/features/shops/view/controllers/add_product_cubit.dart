import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ShopsRepository shopsRepository;

  AddProductCubit({required this.shopsRepository})
    : super(AddProductState(status: AddProductStatus.initial));

  Future<void> getShops() async {
    emit(state.copyWith(status: AddProductStatus.loading));

    try {
      final shops = await shopsRepository.getShops();
      emit(state.copyWith(status: AddProductStatus.success, shops: shops));
    } catch (error) {
      emit(
        state.copyWith(status: AddProductStatus.error, error: error.toString()),
      );
    }
  }
}
