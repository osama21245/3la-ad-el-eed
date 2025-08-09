import 'package:_3la_ad_el_eed/features/trip/view/screens/trip_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/comman/classes/firestore_services.dart';
import 'features/create_zone/data/repo/create_zone.dart';
import 'features/create_zone/presentation/cubit/create_zone_cubit.dart';
import 'features/create_zone/presentation/screens/create_zone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => CreateZoneOnMapCubit(
                createZoneOnMapRepo: CreateZoneOnMapRepo(
                  firestoreService: FirestoreService(),
                ),
              ),
          child: CreateZoneOnMapScreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: CreateZoneOnMapScreen(),

        //MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
