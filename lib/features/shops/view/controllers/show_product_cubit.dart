import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/show_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowProductCubit extends Cubit<ShowProductState> {
  final ShopsRepository shopRepository;

  ShowProductCubit({required this.shopRepository}) : super(ShowProductInitial());

  Future<void> fetchProducts() async {
    emit(ShowProductLoading());
    try {
      final products = await shopRepository.fetchProducts();
      emit(ShowProductSuccess(products: products));
    } catch (e) {
      emit(ShowProductError(error: e.toString()));
    }
  }
}
