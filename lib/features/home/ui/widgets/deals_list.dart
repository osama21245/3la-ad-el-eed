import 'package:_3la_ad_el_eed/features/home/ui/cubit/home_cubit.dart';
import 'package:_3la_ad_el_eed/features/home/ui/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // TODO initial function to get homeData and start check state of ui {HomeScreen}
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 3 / 4,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 4,

            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
