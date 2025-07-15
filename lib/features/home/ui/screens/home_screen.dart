import 'package:_3la_ad_el_eed/features/home/ui/cubit/home_cubit.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/custom_search.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/deals_list.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/home_app_bar.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/home_title_text.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/popular_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearch(),
                SizedBox(height: 35),
                HomeTitleText(text: "Deals for you"),
                SizedBox(height: 20),
                //DealsList Not Complete Wating for taking about data source and way
                DealsList(),
                SizedBox(height: 20),
                HomeTitleText(text: "Popular Categories"),
                SizedBox(height: 20),
                PopularCategoriesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
