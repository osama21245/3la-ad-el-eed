

import 'package:_3la_ad_el_eed/features/admin/data/data_source/shops_remote_datasource.dart';
import 'package:_3la_ad_el_eed/features/admin/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/admin/data/respository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/change%20request%20status%20cubit/change_request_status_cubit.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/change%20request%20status%20cubit/change_request_status_state.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shop%20by%20Id/get_shop_by_id_cubit.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shop%20by%20Id/get_shop_by_id_state.dart';
import 'package:_3la_ad_el_eed/features/admin/view/screens/clarify_rejection_screen.dart';
import 'package:_3la_ad_el_eed/features/admin/view/widgets/shop_data_widget.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/shop_info_row.dart';

class ShopRequestScreen extends StatelessWidget {
  const ShopRequestScreen({super.key,required this.shop});
final Shop shop ;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider( create: (context)=> GetShopByIDCubit(shopsRepository: ShopsRepository(remoteDataSource: ShopsRemoteDataSource()))..getShopByID(shop.id!),),
      BlocProvider(create: (context)=>ChangeRequestStatusCubit(ShopsRepository(remoteDataSource: ShopsRemoteDataSource())),)
    ],

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            shop.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "PlusJakartaSans",
              color: Color(0xff171212),
            ),
          ),
          leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.close_rounded, size: 28),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
             ShopDataWidget(shop: shop,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<
                    GetShopByIDCubit,GetShopByIDState>(
                  builder:(context,state){
                    if(state.status == GetShopByIDStatus.success){

                      if(state.shop!.requestStatus == 1){

                        return Center(child: Text('Accepted',style: TextStyle(color: Colors.greenAccent,fontSize: 24),),);
                      }else if(state.shop!.requestStatus==-1){
                        return Center(child: Text('Rejected',style: TextStyle(color: Colors.red,fontSize: 24),),);
                      }

                    }
                    else if(state.status == GetShopByIDStatus.error){
                      return Center(child: Text(state.error!,style: TextStyle(color: Colors.red,fontSize: 24),),);
                    }
                    else if(state.status == GetShopByIDStatus.loading){
                      return Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: [
                        Expanded(

                    child: CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(providers: [
                              BlocProvider.value( value: BlocProvider.of<ChangeRequestStatusCubit>(context)),
                              BlocProvider.value( value: BlocProvider.of<GetShopByIDCubit>(context),)
                            ],

                              child: ClarifyRejectionScreen(shop: shop),
                            ),
                          ),
                        );
                      },
                      text: 'Reject',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.white,
                      ),
                      borderRadius: 12,
                      backgroundColor: Color(0xffAA4824),
                    ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: CustomButton(onPressed: (){
                            BlocProvider.of<ChangeRequestStatusCubit>(context).acceptRequestStatus(shop);
                            BlocProvider.of<GetShopByIDCubit>(context).getShopByID(shop.id!);
                          }, text: 'Accept', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'PlusJakartaSans',
                            color: Color(0xff171212),
                          ), borderRadius: 12, backgroundColor: Color(0xffF9BA8C)),
                        )

                      ],
                    );
                  }
                ),
              ),
              SizedBox(height: 24,)
            ],
          ),
        ),
      ),
    );
  }
}
