import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Image.asset('assets/images/grocery.png')),
        SizedBox(height: 12,),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Grocery',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff171212),
            ),
          ),
        ),
      ],
    );
  }
}

// GridTile(
//
// leading: Image.asset('assets/images/lotfy.png') ,
// title: Text(shop.name,style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// fontFamily: "PlusJakartaSans",
// color: Color(0xff171212),
// )),
