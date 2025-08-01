import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/cubit/shop_location_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/show_map_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

// ignore: must_be_immutable
class GetShopLocationScreen extends StatefulWidget {
  GetShopLocationScreen({super.key});

  @override
  State<GetShopLocationScreen> createState() => _GetShopLocationScreenState();
}

class _GetShopLocationScreenState extends State<GetShopLocationScreen> {
  late Position position;
  @override
  void initState() {
    super.initState();
    context.read<ShopLocationCubit>().getCurrantLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLocationCubit, ShopLocationState>(
      listener: (context, state) {
        if (state.state == ShopLocationStates.getCurrantLocationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      buildWhen: (previous, current) {
        if (current.state == ShopLocationStates.currantLocationRequest ||
            current.state == ShopLocationStates.getCurrantLocationSuccess ||
            current.state == ShopLocationStates.getCurrantLocationFailure) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state.state == ShopLocationStates.currantLocationRequest) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.asset(
                  "assets/gif/location_request.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        }
        if (state.state == ShopLocationStates.getCurrantLocationSuccess) {
          return ShowMapBody(cuurrantLocation: state.currantPosition);
        } else if (state.state ==
            ShopLocationStates.getCurrantLocationFailure) {
          return ShowMapBody(cuurrantLocation: null);
        } else {
          return ShowMapBody(cuurrantLocation: null);
        }
      },
    );
  }
}
