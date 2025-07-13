
import 'package:flutter/material.dart';

import '../widgets/add_shop_form_widget.dart';

class AddShopScreen extends StatelessWidget {
  const AddShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Add a shop',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: "PlusJakartaSans",
            color: Color(0xff171212),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close_rounded, size: 28),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [AddShopFormWidget()]),
        ),
      ),
    );
  }
}
