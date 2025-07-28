import 'package:_3la_ad_el_eed/features/admin/data/respository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/change%20request%20status%20cubit/change_request_status_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/shop.dart';

class ChangeRequestStatusCubit extends Cubit<ChangeRequestStatusState> {
  ChangeRequestStatusCubit(this.shopsRepository)
    : super(ChangeRequestStatusState(status: ChangeRequestStatus.initial));
  final ShopsRepository shopsRepository;
  Future<void> acceptRequestStatus(Shop shop) async {
    emit(state.copyWith(status: ChangeRequestStatus.loading));
    final result = await shopsRepository.acceptRequestStatus(shop);
    result.fold(
      (error) {
        emit(
          ChangeRequestStatusState(
            status: ChangeRequestStatus.error,
            error: error,
          ),
        );
      },
      (_) {
        final updatedShop = Shop(
          userID:shop.userID,
          id: shop.id,
          requestStatus: 1,
          shopImage: shop.shopImage,
          nationalIDImage: shop.nationalIDImage,
          commercialRegistrationCertificateImage:
              shop.commercialRegistrationCertificateImage,
          taxIdentificationCertificateImage:
              shop.taxIdentificationCertificateImage,
          businessLicenseImage: shop.businessLicenseImage,
          bankAccountDetailsImage: shop.bankAccountDetailsImage,
          name: shop.name,
          address: shop.address,
          phone: shop.phone,
          email: shop.email,
          website: shop.website,
          category: shop.category,
          description: shop.description,
          shopPassword: shop.shopPassword,
          adminRejectionReasonMessage: shop.adminRejectionReasonMessage,
        );
        emit(
          state.copyWith(
            status: ChangeRequestStatus.success,
            updatedShop: updatedShop,
          ),
        );
      },
    );
  }

  Future<void> rejectRequestStatus(Shop shop, String adminMessage) async {
    emit(state.copyWith(status: ChangeRequestStatus.loading));
    final result = await shopsRepository.rejectRequestStatus(
      shop,
      adminMessage,
    );
    final updatedShop = Shop(
      userID: shop.userID,
      id: shop.id,
      requestStatus: -1,
      shopImage: shop.shopImage,
      nationalIDImage: shop.nationalIDImage,
      commercialRegistrationCertificateImage:
          shop.commercialRegistrationCertificateImage,
      taxIdentificationCertificateImage: shop.taxIdentificationCertificateImage,
      businessLicenseImage: shop.businessLicenseImage,
      bankAccountDetailsImage: shop.bankAccountDetailsImage,
      name: shop.name,
      address: shop.address,
      phone: shop.phone,
      email: shop.email,
      website: shop.website,
      category: shop.category,
      description: shop.description,
      shopPassword: shop.shopPassword,
      adminRejectionReasonMessage: shop.adminRejectionReasonMessage,
    );
    result.fold(
      ((error) {
        emit(
          ChangeRequestStatusState(
            status: ChangeRequestStatus.error,
            error: error,
          ),
        );
      }),
      (_) {
        emit(
          state.copyWith(
            status: ChangeRequestStatus.success,
            updatedShop: updatedShop,
          ),
        );
      },
    );
  }
}
