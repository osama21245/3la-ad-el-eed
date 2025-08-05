import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shops%20cubit/get_shops_cubit.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shops%20cubit/get_shops_state.dart';
import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_item_widget.dart';
import 'package:_3la_ad_el_eed/features/shops/data/data_source/add_shop_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/add_shop_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopsAdditionRequestsScreen extends StatelessWidget {
  const ShopsAdditionRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>GetShopsCubit(shopsRepository: AddShopRepository(remoteDataSource: AddShopRemoteDatasource()))..getShops())

    ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Shops Requests',
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
        body:BlocBuilder<GetShopsCubit,GetShopsState>(builder: (context,state){
           if(state.status == GetShopsStatus.success){
              if(state.shops!.isNotEmpty) {
                return
                ListView.builder(
               itemCount: state.shops!.length,
               itemBuilder:
                   (context, i) => ShopItemWidget(
                 shop: state.shops![i]
               ),
             );} else{
                return Center(child: Text('No requests to Review'),);
              }
           }
           else if( state.status == GetShopsStatus.loading){
             return Center(child: CircularProgressIndicator(),);
           } else if(state.status==GetShopsStatus.error){
             return Center(child: Text( 'Error : ${state.error!}'),);
           }
           else {
             return SizedBox();
           }
        })
      ),
    );
  }
}
