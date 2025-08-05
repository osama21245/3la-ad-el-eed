 create_trip
import 'package:_3la_ad_el_eed/core/services/service_locator.dart';
import 'package:_3la_ad_el_eed/features/trip/view/screens/trip_screen.dart';
import 'package:_3la_ad_el_eed/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


 add_product
import 'package:_3la_ad_el_eed/features/admin/view/screens/block_user.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/add_product.dart';

import 'package:_3la_ad_el_eed/features/admin/view/screens/shops_addition_requests_screen.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/add_shop.dart';
import 'package:_3la_ad_el_eed/features/user/view/screens/reviewing_result_screen.dart';
 development
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';






 create_trip
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


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
 development
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 create_trip
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TripScreen(),

      //MyHomePage(title: 'Flutter Demo Home Page'),

      home: const BlockUser(),
 development
    );
  }
}



