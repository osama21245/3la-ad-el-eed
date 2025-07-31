// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';

enum GetShopsStatus { initial, loading, success, error }

extension GetShopsStateExtension on GetShopsState {
  bool get isInitial => status == GetShopsStatus.initial;
  bool get isLoading => status == GetShopsStatus.loading;
  bool get isSuccess => status == GetShopsStatus.success;
  bool get isError => status == GetShopsStatus.error;
}

class GetShopsState {
  final GetShopsStatus status;
  final String? error;
  final List<Shop>? shops;

  GetShopsState({required this.status, this.error, this.shops});

  GetShopsState copyWith({
    GetShopsStatus? status,
    String? error,
    List<Shop>? shops,
  }) {
    return GetShopsState(
      status: status ?? this.status,
      error: error ?? this.error,
      shops: shops ?? this.shops,
    );
  }

  @override
  String toString() =>
      'GetShopsState(status: $status, error: $error, shops: $shops)';
}
