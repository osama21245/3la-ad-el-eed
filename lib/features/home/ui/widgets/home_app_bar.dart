import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,

      title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w600)),
      centerTitle: true,
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      actions: [Icon(Icons.shopping_cart_outlined)],
    );
  }
}
