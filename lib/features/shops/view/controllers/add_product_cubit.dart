 add_product
import 'dart:io';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  // final ShopsRepository shopsRepository;

 add_shop
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
// import 'add_product_state.dart';
//
// class AddProductCubit extends Cubit<AddProductState> {
//   final ShopsRepository shopsRepository;
//
//   AddProductCubit({required this.shopsRepository})
//       : super(AddProductState(status: AddProductStatus.initial));
//
//   Future<void> getShops() async {
//     emit(state.copyWith(status: AddProductStatus.loading));
//
//     final result = await shopsRepository.getShops();
//
//     result.fold(
//           (failure) => emit(
//         state.copyWith(
//           status: AddProductStatus.error,
//           error: failure,
//         ),
//       ),
//           (shops) => emit(
//         state.copyWith(
//           status: AddProductStatus.success,
//           shops: shops,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
 development
  final ShopsRepository shopsRepository;

  AddProductCubit({required this.shopsRepository})
    : super(AddProductState(status: AddProductStatus.initial));
 add_product
  //   : super(AddProductState(status: AddProductStatus.initial));
  //
  // Future<void> getShops() async {
  //   emit(state.copyWith(status: AddProductStatus.loading));
  //
  //   try {
  //     final shops = await shopsRepository.getShops();
  //     emit(state.copyWith(status: AddProductStatus.success, shops: shops));
  //   } catch (error) {
  //     emit(
  //       state.copyWith(status: AddProductStatus.error, error: error.toString()),
  //     );
  //   }
  // }

  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required File imageBase64,
    required String shopId,
    required String userId,
  }) async {
    emit(state.copyWith(status: AddProductStatus.loading));
    try {
      await shopsRepository.addProduct(
        name: name,
        description: description,
        price: price,
        imageFile: imageBase64,
        shopId: shopId,
        userId: userId,
      );
      emit(state.copyWith(status: AddProductStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddProductStatus.error, error: e.toString()));
    }
  }
}


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
 development
 development
