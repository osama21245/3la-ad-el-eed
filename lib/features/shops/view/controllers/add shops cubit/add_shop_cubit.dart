import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/shop.dart';
import '../../../data/repository/shops_repository.dart';
import 'add_shop_state.dart';

class AddShopCubit extends Cubit<AddShopState> {
  final ShopsRepository shopsRepository;

  AddShopCubit({required this.shopsRepository}) : super(AddShopState.initial());

  Future<void> addShop(Shop shop) async {
    emit(state.copyWith(status: AddShopStatus.loading));
    final result = await shopsRepository.addShop(shop);
    result.fold(
      (failure) => emit(
        state.copyWith(status: AddShopStatus.error, errorMessage: failure),
      ),
      (_) => emit(state.copyWith(status: AddShopStatus.success)),
    );
  }

  Future<void> addShopWithImage(File imageFile, Shop shop) async {
    emit(state.copyWith(status: AddShopStatus.loading));

    final imageUrlResult = await shopsRepository.uploadImage(imageFile);

    imageUrlResult.fold(
          (failure) {
        emit(state.copyWith(status: AddShopStatus.error, errorMessage: failure));
      },
          (url) async {
        final shopWithImage = Shop(
          category: shop.category,
          description: shop.description,
          id: shop.id,
          image: url,
          name: shop.name,
          address: shop.address,
          phone: shop.phone,
          email: shop.email,
          website: shop.website,
        );

        final result = await shopsRepository.addShop(shopWithImage);
        result.fold(
              (failure) => emit(state.copyWith(status: AddShopStatus.error, errorMessage: failure)),
              (_) => emit(state.copyWith(status: AddShopStatus.success)),
        );
      },
    );
  }

}
