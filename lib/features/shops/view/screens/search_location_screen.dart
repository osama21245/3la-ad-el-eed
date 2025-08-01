import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/location_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (val) {
                      context.read<ShopLocationCubit>().searchPlaces(
                        query: val,
                      );
                    },
                    textInputAction: TextInputAction.search,
                    cursorColor: Color(0xFFEB7E3E),
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Color.fromARGB(67, 235, 126, 62),
                      hintText: "Search Your Location",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<ShopLocationCubit, ShopLocationState>(
                builder: (context, state) {
                  if (state.state == ShopLocationStates.searchPlacesLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,

                      child: ListView.builder(
                        padding: EdgeInsets.all(5),
                        itemExtent: 100,
                        itemBuilder:
                            (context, i) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LocationListTiles(
                                onTap: () {

                                    context
                                      .read<ShopLocationCubit>()
                                      .getLatLngFromPlaceId(
                                        placeId: state.predictions[i].placeId,
                                        context: context
                                      );
                                },
                                location: state.predictions[i].description,
                              ),
                            ),
                        itemCount: state.predictions.length,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
