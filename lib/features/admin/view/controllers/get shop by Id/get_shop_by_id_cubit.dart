

import 'package:_3la_ad_el_eed/features/admin/data/respository/shops_repository.dart';
import 'package:_3la_ad_el_eed/features/admin/view/controllers/get%20shop%20by%20Id/get_shop_by_id_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShopByIDCubit extends Cubit<GetShopByIDState> {
  final ShopsRepository shopsRepository;

  GetShopByIDCubit({required this.shopsRepository})
      : super(GetShopByIDState(status: GetShopByIDStatus.initial));


  Future<void>getShopByID(String id)async{
   final result = await shopsRepository.getShopByID(id);
   result.fold((error){
     emit(state.copyWith(status:  GetShopByIDStatus.error,error: error));

   }, (shop){
     emit(state.copyWith(status:  GetShopByIDStatus.success,shop: shop));

   });
  }
}
