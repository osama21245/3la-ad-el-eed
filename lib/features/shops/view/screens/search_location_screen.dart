import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/location_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatelessWidget {
  SearchLocationScreen({super.key});
  TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ShopLocationCubit, ShopLocationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Form(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (val) {
                        context.read<ShopLocationCubit>().searchPlaces(
                          query: query.text,
                        );
                      },
                      textInputAction: TextInputAction.search,
                      controller: query,
                      decoration: InputDecoration(
                        hintText: "Search Your Location",
                        prefixIcon: Icon(Icons.location_on_rounded),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemBuilder:
                        (context, i) =>
                            LocationListTiles(onTap: () {}, location: state.predictions[i].description),
                    itemCount:  state.predictions.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
