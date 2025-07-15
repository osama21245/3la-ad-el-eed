import 'package:_3la_ad_el_eed/features/admin/data/data_source/get_shop_request_data_source.dart';
import 'package:_3la_ad_el_eed/features/admin/data/models/shop_request_model.dart';
abstract interface class GetShopRequestsRepo {
  Future<List<ShopRequestModel>> getShopRequests();
}

class GetShopRequestsRepoImpl implements GetShopRequestsRepo {
  final GetShopRequestDataSourceImpl getShopRequestDataSourceImpl;

  GetShopRequestsRepoImpl({required this.getShopRequestDataSourceImpl});
  @override
  Future<List<ShopRequestModel>> getShopRequests() async {
    // We Need To Adding Caching system in future
    final List<Map<String, dynamic>> shopRequest =
        await getShopRequestDataSourceImpl.getShopRequest();
    return  shopRequest.map((e) => ShopRequestModel.fromJson(e)).toList();
  }
}
