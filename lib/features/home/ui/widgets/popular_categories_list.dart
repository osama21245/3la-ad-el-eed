import 'package:_3la_ad_el_eed/features/home/ui/cubit/home_cubit.dart';
import 'package:_3la_ad_el_eed/features/home/ui/cubit/home_state.dart';
import 'package:_3la_ad_el_eed/features/home/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularCategoriesList extends StatelessWidget {
  const PopularCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // TODO initial function to get homeData and start check state of ui {HomeScreen}
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 3.7,
            ),
            itemCount: 4,

            itemBuilder: (context, i) {
              // Useing static data until continuou in logic without inject category data
              return CategoryCard();
            },
          );
        },
      ),
    );
  }
}
