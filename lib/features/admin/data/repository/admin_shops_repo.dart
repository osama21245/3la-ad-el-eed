import 'package:_3la_ad_el_eed/features/admin/data/data_source/admin_shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';

class AdminShopsRepo {
  final AdminShopsRemoteDatasource adminShopsRemoteDatasource;

  AdminShopsRepo({required this.adminShopsRemoteDatasource});
  acceptRequestStatus(Shop shop) {
    adminShopsRemoteDatasource.acceptRequestStatus(shop);
  }

  rejectRequestStatus(Shop shop, String adminMessage) {
    adminShopsRemoteDatasource.rejectRequestStatus(shop, adminMessage);
  }
}
