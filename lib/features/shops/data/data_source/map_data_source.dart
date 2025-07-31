import 'dart:convert';
import 'package:_3la_ad_el_eed/core2/const/constant.dart';
import 'package:http/http.dart' as http;

abstract class MapDataSource {
  // Future<bool> addShopLocation(
  //   String userId,
  //   String shopId,
  //   double shopLat,
  //   double shopLng,
  // );
  Future<List>  placeAutocomlate({required String query});
}

class MapDataSourceImpl implements MapDataSource {
  // @override
  // Future<bool> addShopLocation(
  //   String userId,
  //   String shopId,
  //   double shopLat,
  //   double shopLng,
  // ) async {
  //   try {
  //     CollectionReference shopLocationRef = FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(userId)
  //         .collection("shop")
  //         .doc(shopId)
  //         .collection("location");
  //     await shopLocationRef.add({"lat": shopLat, "lng": shopLng});
  //     return true;
  //   } catch (e) {
  //     log(">>>> Error When Add ShopLocation DataSource $e");
  //     return false;
  //   }
  // }

  @override
  Future<List> placeAutocomlate({required String query}) async {
    final String requestUrl =
        '${Constant.baseUrl}?input=$query&key=${Constant.apiKey}&language=ar&components=country:eg';
    try {
      final response = await http.get(Uri.parse(requestUrl));
      final Map<String, dynamic> json = await jsonDecode(response.body);

      return json["predictions"];
    } catch (e) {
      throw ">>>-> Error When SearchPlaces: $e";
    }
  }
}
