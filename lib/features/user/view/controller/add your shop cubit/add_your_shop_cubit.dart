import 'dart:io';

import 'package:_3la_ad_el_eed/features/user/data/repository/your_shop_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/shop.dart';

import 'add_your_shop_state.dart';

class AddYourShopCubit extends Cubit<AddYourShopState> {
  final YourShopRepository yourShopsRepository;

  AddYourShopCubit({required this.yourShopsRepository})
      : super(AddYourShopState.initial());

  Future<void> addYourShop(Shop shop, String category) async {
    emit(state.copyWith(status: AddYourShopStatus.loading));
    final result = await yourShopsRepository.addYourShop(shop, category);
    result.fold(
          (failure) =>
          emit(
            state.copyWith(
                status: AddYourShopStatus.error, errorMessage: failure),
          ),
          (_) => emit(state.copyWith(status: AddYourShopStatus.success)),
    );
  }

//   Future<void> addShopWithImages({
//     required Shop shop,
//     required File shopImage,
//     required File nationalIDImage,
//     required File commercialRegistrationCertificateImage,
//     required File taxIdentificationCertificateImage,
//     required File businessLicenseImage,
//     required File bankAccountDetailsImage,
//   }) async {
//     emit(state.copyWith(status: AddYourShopStatus.loading));
//
//     try {
//       String? shopImageUrl;
//       String? nationalIDImageUrl;
//       String? commercialRegistrationUrl;
//       String? taxCertificateUrl;
//       String? businessLicenseUrl;
//       String? bankAccountUrl;
//
//         shopImageUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(shopImage);
//
//         nationalIDImageUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(nationalIDImage);
//
//         commercialRegistrationUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(commercialRegistrationCertificateImage);
//
//         taxCertificateUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(taxIdentificationCertificateImage);
//
//         businessLicenseUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(businessLicenseImage);
//
//         bankAccountUrl = await yourShopsRepository.yourShopRemoteDataSource.uploadImage(bankAccountDetailsImage);
//
//
//       final updatedShop = Shop(
//         adminRejectionReasonMessage: shop.adminRejectionReasonMessage,
//         requestStatus: shop.requestStatus,
//         id: shop.id,
//         name: shop.name,
//         address: shop.address,
//         phone: shop.phone,
//         email: shop.email,
//         website: shop.website,
//         category: shop.category,
//         description: shop.description,
//         shopPassword: shop.shopPassword,
//         shopImage: shopImageUrl,
//         nationalIDImage: nationalIDImageUrl,
//         commercialRegistrationCertificateImage: commercialRegistrationUrl,
//         taxIdentificationCertificateImage: taxCertificateUrl,
//         businessLicenseImage: businessLicenseUrl,
//         bankAccountDetailsImage: bankAccountUrl,
//       );
//
//       final result = await yourShopsRepository.addYShop(updatedShop);
//
//       result.fold(
//             (failure) => emit(state.copyWith(status: AddYourShopStatus.error, errorMessage: failure)),
//             (_) => emit(state.copyWith(status: AddYourShopStatus.success)),
//       );
//     } catch (e) {
//       emit(state.copyWith(status: AddYourShopStatus.error, errorMessage: e.toString()));
//     }
//   }
//
// }
}