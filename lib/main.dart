 add_product
import 'package:_3la_ad_el_eed/features/admin/view/screens/block_user.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/add_product.dart';

import 'package:_3la_ad_el_eed/features/admin/view/screens/shops_addition_requests_screen.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/add_shop.dart';
import 'package:_3la_ad_el_eed/features/user/view/screens/reviewing_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';






 development
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/di/dependency_injection.dart';
import 'features/shops/view/screens/show_products.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  intl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BlockUser(),
    );
  }
}



