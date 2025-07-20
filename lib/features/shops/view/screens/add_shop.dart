
import 'package:_3la_ad_el_eed/features/shops/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add%20shops%20cubit/add_shop_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add_shop_form_widget.dart';

class AddShopScreen extends StatelessWidget {
  const AddShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

      BlocProvider(create: (context)=>AddShopCubit(shopsRepository: ShopsRepository(remoteDataSource: ShopsRemoteDataSource()))),
    ],
      child: Scaffold(
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
      ),
    );
  }
}
