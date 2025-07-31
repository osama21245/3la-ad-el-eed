import 'package:flutter/material.dart';
class AddShopAppBarWidget extends StatelessWidget {
  const AddShopAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.close_rounded,size: 24,)),

        Text('Add a shop',style: TextStyle(fontSize: 18,fontWeight:FontWeight.w700,fontFamily: "PlusJakartaSans",color: Color(0xff171212)),),
      ],
    );
  }
}
