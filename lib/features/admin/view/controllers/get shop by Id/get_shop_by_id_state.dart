// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';

enum GetShopByIDStatus { initial, loading, success, error }

extension GetShopByIDStateExtension on GetShopByIDState {
  bool get isInitial => status == GetShopByIDStatus.initial;
  bool get isLoading => status == GetShopByIDStatus.loading;
  bool get isSuccess => status == GetShopByIDStatus.success;
  bool get isError => status == GetShopByIDStatus.error;
}

class GetShopByIDState {
  final GetShopByIDStatus status;
  final String? error;
  final Shop? shop;

  GetShopByIDState({required this.status, this.error, this.shop});

  GetShopByIDState copyWith({
    GetShopByIDStatus? status,
    String? error,
    Shop? shop,

  }) {
    return GetShopByIDState(
      status: status ?? this.status,
      error: error ?? this.error,
      shop: shop ?? this.shop,
    );
  }

  @override
  String toString() =>
      'GetShopByIDState(status: $status, error: $error, shop: $shop)';
}
