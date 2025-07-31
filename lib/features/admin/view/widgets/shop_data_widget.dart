import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_data_images.dart';
import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_info_row.dart';
import 'package:flutter/material.dart';
class ShopDataWidget extends StatelessWidget {
  const ShopDataWidget({super.key,required this.shop});
final Shop shop;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        SizedBox(height: 24,),
ShopDataImages(shop: shop),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopInfoRow(title: 'Shop Address', value: shop.address),
              ShopInfoRow(title: 'Description', value: shop.description),
              ShopInfoRow(title: 'Type', value: shop.category),
              ShopInfoRow(title: 'Phone', value: shop.phone),
              ShopInfoRow(title: 'Website', value: shop.website),
            ],
          ),
        ),

        SizedBox(height: 24,)
      ],
    );
  }
}
