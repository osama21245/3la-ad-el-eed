import 'package:_3la_ad_el_eed/features/admin/data/models/shop_request_model.dart';
// TODO we will useing this way to create states
// enum FetchStates { init, loading, success, failure }

// class FetchShopRequestState {
//   late FetchStates state;
//   late ShopRequestModel shopRequests;
//   late String errorMessage;

// }
 class GetShopRequestsState {}

class GetShopRequestsLoadingState extends GetShopRequestsState{}

class GetShopRequestsLoadedState extends GetShopRequestsState {
  final List<ShopRequestModel> shopRequests;

GetShopRequestsLoadedState({required this.shopRequests});
}

class GetShopRequestsErrorState extends GetShopRequestsState {
  final String errorMessage;

  GetShopRequestsErrorState({required this.errorMessage});
}
