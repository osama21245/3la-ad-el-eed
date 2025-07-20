import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/admin/view/screens/shop_request_screen.dart';

import 'package:flutter/material.dart';



class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget({super.key, required this.shop});
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopRequestScreen(shop: shop,)));

      },
      child: ListTile(
        leading: Image.network(shop.shopImage!)
        ,
        title: Text(
          shop.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakartaSans',
            color: Color(0xff171212),
          ),
        ),
        subtitle: Text(
          shop.website,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'PlusJakartaSans',
            color: Color(0xff82696B),
          ),
        ),
        trailing: Icon(Icons.arrow_circle_right_outlined, size: 30),
      ),
    );
  }
}

// GridTile(
//
// leading: Image.asset('assets/images/ganoby.png') ,
// title: Text(shop.name,style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// fontFamily: "PlusJakartaSans",
// color: Color(0xff171212),
// )),
