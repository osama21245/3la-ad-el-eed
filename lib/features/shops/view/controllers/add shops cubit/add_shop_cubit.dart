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

  Future<void> addShopWithImages({
    required Shop shop,
    required File shopImage,
    required File nationalIDImage,
    required File commercialRegistrationCertificateImage,
    required File taxIdentificationCertificateImage,
    required File businessLicenseImage,
    required File bankAccountDetailsImage,
  }) async {
    emit(state.copyWith(status: AddShopStatus.loading));

    try {
      String? shopImageUrl;
      String? nationalIDImageUrl;
      String? commercialRegistrationUrl;
      String? taxCertificateUrl;
      String? businessLicenseUrl;
      String? bankAccountUrl;

        shopImageUrl = await shopsRepository.remoteDataSource.uploadImage(shopImage);

        nationalIDImageUrl = await shopsRepository.remoteDataSource.uploadImage(nationalIDImage);

        commercialRegistrationUrl = await shopsRepository.remoteDataSource.uploadImage(commercialRegistrationCertificateImage);

        taxCertificateUrl = await shopsRepository.remoteDataSource.uploadImage(taxIdentificationCertificateImage);

        businessLicenseUrl = await shopsRepository.remoteDataSource.uploadImage(businessLicenseImage);

        bankAccountUrl = await shopsRepository.remoteDataSource.uploadImage(bankAccountDetailsImage);


      final updatedShop = Shop(
        userID: shop.userID,
        adminRejectionReasonMessage: shop.adminRejectionReasonMessage,
        requestStatus: shop.requestStatus,
        id: shop.id,
        name: shop.name,
        address: shop.address,
        phone: shop.phone,
        email: shop.email,
        website: shop.website,
        category: shop.category,
        description: shop.description,
        shopPassword: shop.shopPassword,
        shopImage: shopImageUrl,
        nationalIDImage: nationalIDImageUrl,
        commercialRegistrationCertificateImage: commercialRegistrationUrl,
        taxIdentificationCertificateImage: taxCertificateUrl,
        businessLicenseImage: businessLicenseUrl,
        bankAccountDetailsImage: bankAccountUrl,
      );

      final result = await shopsRepository.addShop(updatedShop);

      result.fold(
            (failure) => emit(state.copyWith(status: AddShopStatus.error, errorMessage: failure)),
            (_) => emit(state.copyWith(status: AddShopStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: AddShopStatus.error, errorMessage: e.toString()));
    }
  }

}
