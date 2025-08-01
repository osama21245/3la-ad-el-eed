import 'dart:async';
import 'package:_3la_ad_el_eed/features/shops/data/models/search_places_model.dart';
import 'package:_3la_ad_el_eed/features/shops/data/repository/map_repo.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopLocationCubit extends Cubit<ShopLocationState> {
  final MapRepoImpl mapRepoImpl;
  AssetMapBitmap? _markIcon;
   GoogleMapController? _mapController;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  ShopLocationCubit(this.mapRepoImpl)
    : super(
        ShopLocationState(
          state: ShopLocationStates.init,
          selectingMode: LocationSelectMode.centerMarker,
          currantPosition: LatLng(30.033333, 31.233334),
          shopMark: {},
          errorMessage: '',
          predictions: [],
          searchResultPosition: LatLng(30.033333, 31.233334),
        ),
      );
  Future<void> getCurrantLocation() async {
    emit(state.copyWith(state: ShopLocationStates.currantLocationRequest));
    _markIcon = await BitmapDescriptor.asset(
      ImageConfiguration.empty,
      "assets/images/marker_icon.png",
      height: 50,
      width: 50,
    );
    Either<String, Position> either = await mapRepoImpl.getCurrantLocation();
    either.fold(
      (error) {
        emit(
          state.copyWith(
            state: ShopLocationStates.getCurrantLocationFailure,
            errorMessage: error.toString(),
          ),
        );
      },
      (position) {
        emit(
          state.copyWith(
            state: ShopLocationStates.getCurrantLocationSuccess,
            currantPosition: LatLng(position.latitude, position.longitude),
          ),
        );
      },
    );
  }

  selectLocation({required LatLng markePosition, imageConf}) async {
    emit(
      state.copyWith(
        state: ShopLocationStates.selectShopLocationOnMap,
        shopMark: {
          Marker(
            icon: _markIcon!,

            markerId: MarkerId("ShopMark"),
            position: markePosition,
            infoWindow: InfoWindow(title: "Your Shop Location"),
          ),
        },
      ),
    );
  }

  Future searchPlaces({required String query}) async {
    emit(state.copyWith(state: ShopLocationStates.searchPlacesLoading));
    final List<PredictionModel> predictions = await mapRepoImpl
        .placeAutocomlate(query: query);
    emit(
      state.copyWith(
        state: ShopLocationStates.searchPlaces,
        predictions: predictions,
      ),
    );
  }

  Future getLatLngFromPlaceId({
    required String placeId,
    required BuildContext context,
  }) async {
    final LatLng searchResultLatLng = await mapRepoImpl.getLatLngFromPlaceId(
      placeId: placeId,
    );
    
    Navigator.pop(context);
    
  }

  void changeSelectMode(LocationSelectMode selectedMode, Set<Marker> markes) {
    emit(
      state.copyWith(
        state: ShopLocationStates.changeSelectMode,
        selectingMode: selectedMode,
      ),
    );
  }
}
