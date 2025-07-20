import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_item_widget.dart';
import 'package:flutter/material.dart';

import '../../data/models/shop.dart';
class ShowShopsScreen extends StatelessWidget {
  const ShowShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Popular Categories',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: "PlusJakartaSans",
          color: Color(0xff171212),
        ),
        ),

      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount:4 ,
                itemBuilder:(context,i)=> Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(),
                )),
          ),
        ],
      ),
    );
  }
}
