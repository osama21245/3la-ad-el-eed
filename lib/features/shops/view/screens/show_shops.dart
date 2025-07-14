import 'package:_3la_ad_el_eed/features/shops/view/widgets/shop_item_widget.dart';
import 'package:flutter/material.dart';

import '../../data/models/shop.dart';
class ShowShopsScreen extends StatelessWidget {
  const ShowShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Shops',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: "PlusJakartaSans",
          color: Color(0xff171212),
        ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount:shops.length ,
          itemBuilder:(context,i)=> Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShopItemWidget(shop: shops[i]),
          )),
    );
  }
}
List<Shop>shops =[
  Shop(id: '1', name: 'Lotfy', address: '12 Al-Horrya St', phone: '01234567891', email: "", website: "",image: '',description: '',category: ''),
  Shop(id: '1', name: 'Ganoby', address: '12 Al-Horrya St', phone: '01234567891', email: "", website: "",image: '',description: '',category: ''),

];