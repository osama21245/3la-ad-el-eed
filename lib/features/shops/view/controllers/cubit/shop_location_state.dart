import 'package:_3la_ad_el_eed/features/shops/data/models/search_places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum ShopLocationStates {
  init,
  currantLocationRequest,
  getCurrantLocationSuccess,
  getCurrantLocationFailure,
  getShopLocationSelect,
  selectShopLocationOnMap,
  searchPlaces,
  changeSelectMode,
}

class ShopLocationState {
  final ShopLocationStates state;
  final LocationSelectMode selectingMode;
  final LatLng currantPosition;
  final Set<Marker> shopMark;
  final String errorMessage;
  final List<PredictionModel> predictions;

  const ShopLocationState({
    required this.state,
    required this.selectingMode,
    required this.currantPosition,
    required this.shopMark,
    required this.errorMessage,
    required this.predictions,
  });
  ShopLocationState copyWith({
    ShopLocationStates? state,
    LocationSelectMode? selectingMode,
    LatLng? currantPosition,
    Set<Marker>? shopMark,
    String? errorMessage,
    List<PredictionModel>? predictions,
  }) {
    return ShopLocationState(
      state: state ?? this.state,
      selectingMode: selectingMode ?? this.selectingMode,
      currantPosition: currantPosition ?? this.currantPosition,
      shopMark: shopMark ?? this.shopMark,
      errorMessage: errorMessage ?? this.errorMessage,
      predictions: predictions ?? this.predictions,
    );
  }
}

enum LocationSelectMode { centerMarker, longPress }
