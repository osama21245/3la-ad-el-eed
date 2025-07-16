import 'package:_3la_ad_el_eed/features/admin/data/data_source/get_shop_request_data_source.dart';
import 'package:_3la_ad_el_eed/features/admin/data/models/shop_request_model.dart';
import 'package:_3la_ad_el_eed/features/admin/data/repository/get_shop_request_repo.dart';
import 'package:_3la_ad_el_eed/features/admin/ui/cubit/get_shop_requests_state.dart';
import 'package:bloc/bloc.dart';

class GetShopRequestsCubit extends Cubit<GetShopRequestsState> {
  GetShopRequestsCubit() : super(GetShopRequestsState());
  GetShopRequestsRepoImpl getShopRequestsRepoImpl = GetShopRequestsRepoImpl(
    getShopRequestDataSourceImpl: GetShopRequestDataSourceImpl(),
  );
  Future<void> getShopRequests() async {
    try {
      emit(GetShopRequestsLoadingState());
      List<ShopRequestModel> shopRequests =
          await getShopRequestsRepoImpl.getShopRequests();
      emit(GetShopRequestsLoadedState(shopRequests: shopRequests));
    } catch (e) {
          emit(GetShopRequestsErrorState(errorMessage: e.toString()));
    
    }
  }
}
