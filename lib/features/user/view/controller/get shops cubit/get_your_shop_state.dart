// ignore_for_file: public_member_api_docs, sort_constructors_first



import '../../../data/models/shop.dart';

enum GetYourShopStatus { initial, loading, success, error }

extension GetYourShopStateExtension on GetYourShopState {
  bool get isInitial => status == GetYourShopStatus.initial;
  bool get isLoading => status == GetYourShopStatus.loading;
  bool get isSuccess => status == GetYourShopStatus.success;
  bool get isError => status == GetYourShopStatus.error;
}

class GetYourShopState {
  final GetYourShopStatus status;
  final String? error;
  final Shop? yourShop;

  GetYourShopState({required this.status, this.error, this.yourShop});

  GetYourShopState copyWith({
    GetYourShopStatus? status,
    String? error,
    Shop? yourShop,
  }) {
    return GetYourShopState(
      status: status ?? this.status,
      error: error ?? this.error,
      yourShop: yourShop ?? this.yourShop
    );
  }

  @override
  String toString() =>
      'GetYourShopState(status: $status, error: $error, your: $yourShop)';
}
