import 'package:_3la_ad_el_eed/core2/di2/di_container2.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/search_location_screen.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/center_point.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ShowMapBody extends StatelessWidget {
  ShowMapBody({super.key, required this.cuurrantLocation});
  final LatLng? cuurrantLocation;
  LatLng? _cameraTarget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ShopLocationCubit, ShopLocationState>(
        buildWhen: (previous, current) {
          if (current.state == ShopLocationStates.getShopLocationSelect) {
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              BlocBuilder<ShopLocationCubit, ShopLocationState>(
                builder: (context, state) {
                  return GoogleMap(
                    onMapCreated: (controller) {
                      if (cuurrantLocation?.latitude == null) {
                        _cameraTarget = state.currantPosition;
                      } else {
                        _cameraTarget = LatLng(
                          cuurrantLocation!.latitude,
                          cuurrantLocation!.longitude,
                        );
                      }
                    },
                    markers: state.shopMark,
                    indoorViewEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    onCameraMove: (position) {
                      _cameraTarget = position.target;
                    },
                    initialCameraPosition: CameraPosition(
                      zoom: 9,
                      target: LatLng(
                        state.currantPosition.latitude,
                        state.currantPosition.longitude,
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ShopLocationCubit, ShopLocationState>(
                builder: (context, state) {
                  return Visibility(
                    visible:
                        state.selectingMode == LocationSelectMode.centerMarker,
                    child: CenterPoint(),
                  );
                },
              ),
              Positioned(
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.37,
                child: BlocBuilder<ShopLocationCubit, ShopLocationState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ShopLocationCubit>().selectLocation(
                          markePosition: _cameraTarget!,
                          imageConf: ImageConfiguration.empty,
                        );
                      },
                      child: Visibility(
                        visible:
                            state.selectingMode ==
                            LocationSelectMode.centerMarker,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEB7E3E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Select",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 70,
                left: 20,
                child: BlocBuilder<ShopLocationCubit, ShopLocationState>(
                  builder: (context, state) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFEB7E3E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: DropdownButton<LocationSelectMode>(
                          iconEnabledColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          // put color manual unit create theme class
                          dropdownColor: Color(0xFFEB7E3E),
                          value: state.selectingMode,
                          items: [
                            DropdownMenuItem(
                              value: LocationSelectMode.centerMarker,
                              child: Text('Select With Center Point'),
                            ),
                            DropdownMenuItem(
                              value: LocationSelectMode.longPress,
                              child: Text('Select With Hold Tap'),
                            ),
                          ],
                          onChanged: (mode) {
                            context.read<ShopLocationCubit>().changeSelectMode(
                              mode!,
                              state.shopMark,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => BlocProvider(
                            create: (context) => sl<ShopLocationCubit>(),
                            child: SearchLocationScreen(),
                          ),
                    ),
                  );
                },
                child: Container(color: Colors.grey, height: 60, width: 500),
              ),
            ],
          );
        },
      ),
    );
  }
}
