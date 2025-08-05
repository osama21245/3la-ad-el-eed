import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_image_item.dart';
import 'package:flutter/material.dart';


class ShopDataImages extends StatelessWidget {
  const ShopDataImages({super.key,required this.shop});
final Shop shop ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          ShopImageItem(image: shop.shopImage!, title: 'Shop Logo'),
          SizedBox(height: 15,),
          ShopImageItem(image: shop.nationalIDImage!, title: 'National ID'),
        SizedBox(height: 15,),
          ShopImageItem(image: shop.commercialRegistrationCertificateImage!, title: 'Commercial Registration Certificate'),
        SizedBox(height: 15,),
          ShopImageItem(image: shop.taxIdentificationCertificateImage!, title: 'Tax Identification Certificate'),
        SizedBox(height: 15,),
          ShopImageItem(image: shop.businessLicenseImage!, title: 'Business License'),
        SizedBox(height: 15,),
          ShopImageItem(image: shop.bankAccountDetailsImage!, title: 'Bank Account Details'),
        SizedBox(height: 15,),

          ],
        );
  }
}
