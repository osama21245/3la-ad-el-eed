import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:flutter/material.dart';
class ShopItemWidget extends StatelessWidget {
 ShopItemWidget({super.key,required this.shop});
Shop shop;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/lotfy.png') ,
      title: Text(shop.name,style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "PlusJakartaSans",
        color: Color(0xff171212),
      )),
    );
  }
}
