import 'dart:io';

import 'package:_3la_ad_el_eed/features/user/data/repository/your_shop_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/shop.dart';

import 'delete_your_rejected_request_state.dart';

class DeleteYourRejectedRequestCubit extends Cubit<DeleteYourRejectedRequestState> {
  final YourShopRepository yourShopsRepository;

  DeleteYourRejectedRequestCubit({required this.yourShopsRepository})
      : super(DeleteYourRejectedRequestState.initial());

 Future<void>deleteYourRejectedRequest(Shop shop)async{
   emit(state.copyWith(status: DeleteYourRejectedRequestStatus.loading));
  final  result =await yourShopsRepository.deleteYourRejectedRequest(shop);
  result.fold((error){
    emit(state.copyWith(status: DeleteYourRejectedRequestStatus.error,errorMessage: error));

  }, ((unit){
    emit(state.copyWith( status: DeleteYourRejectedRequestStatus.success));
  }));
 }


}