// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
class ShopImageItem extends StatelessWidget {
  const ShopImageItem({super.key,required this.image,required this.title});
final String image;
final String title;
  @override
  Widget build(BuildContext context) {
    return   Column(

      children: [
      Align(alignment: Alignment.topLeft, child: Text(title)),
        Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Image.network(image)),
      ],
    );
  }
}
