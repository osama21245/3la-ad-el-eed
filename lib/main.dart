//NOTE ANY TEST PROCCESS IN MAIN FILE SHOULD USE TEST PART AND COMENNT AGAING

import 'package:_3la_ad_el_eed/test_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// //   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   REAL MAIN PART   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TestScreen());
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   TEST PART   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TestScreen()
//     );
//   }
// }
