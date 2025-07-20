// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';


enum ChangeRequestStatus { initial, loading, success, error }

extension ChangeRequestStatusStateExtension on ChangeRequestStatusState {
  bool get isInitial => status == ChangeRequestStatus.initial;
  bool get isLoading => status == ChangeRequestStatus.loading;
  bool get isSuccess => status == ChangeRequestStatus.success;
  bool get isError => status == ChangeRequestStatus.error;
}

class ChangeRequestStatusState {
  final ChangeRequestStatus status;
  final String? error;
  final Shop? updatedShop;

  ChangeRequestStatusState({required this.status, this.error,this.updatedShop});

  ChangeRequestStatusState copyWith({
    ChangeRequestStatus? status,
    String? error,
    Shop? updatedShop
  }) {
    return ChangeRequestStatusState(
      status: status ?? this.status,
      error: error ?? this.error,
      updatedShop: updatedShop ?? this.updatedShop
    );
  }

  @override
  String toString() =>
      'ChangeRequestStatusState(status: $status, error: $error ,updatedShop:$updatedShop)';
}