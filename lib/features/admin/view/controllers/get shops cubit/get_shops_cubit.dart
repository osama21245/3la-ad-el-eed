import 'package:_3la_ad_el_eed/features/shops/data/repository/add_shop_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_shops_state.dart';

class GetShopsCubit extends Cubit<GetShopsState> {
  final AddShopRepository shopsRepository;

  GetShopsCubit({required this.shopsRepository})
    : super(GetShopsState(status: GetShopsStatus.initial));

  Future<void> getShops() async {
    emit(state.copyWith(status: GetShopsStatus.loading));

    // List<Shop>? result = await shopsRepository.getShops();
    //     emit(state.copyWith(status: GetShopsStatus.success, shops: result));
  }
}
