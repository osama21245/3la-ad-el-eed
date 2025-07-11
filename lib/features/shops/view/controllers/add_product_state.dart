// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';

enum AddProductStatus { initial, loading, success, error }

extension AddProductStateExtension on AddProductState {
  bool get isInitial => status == AddProductStatus.initial;
  bool get isLoading => status == AddProductStatus.loading;
  bool get isSuccess => status == AddProductStatus.success;
  bool get isError => status == AddProductStatus.error;
}

class AddProductState {
  final AddProductStatus status;
  final String? error;
  final List<Shop>? shops;

  AddProductState({required this.status, this.error, this.shops});

  AddProductState copyWith({
    AddProductStatus? status,
    String? error,
    List<Shop>? shops,
  }) {
    return AddProductState(
      status: status ?? this.status,
      error: error ?? this.error,
      shops: shops ?? this.shops,
    );
  }

  @override
  String toString() =>
      'AddProductState(status: $status, error: $error, shops: $shops)';
}
