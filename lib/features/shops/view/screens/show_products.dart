import 'package:_3la_ad_el_eed/features/shops/view/controllers/show_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../controllers/show_product_cubit.dart';
import '../widgets/custom_product_card.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => sl<ShowProductCubit>()..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Shop Details"), centerTitle: true),
        body: BlocBuilder<ShowProductCubit, ShowProductState>(
          builder: (context, state) {
            if (state is ShowProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShowProductError) {
              return Center(child: Text(state.error));
            } else if (state is ShowProductSuccess && state.products.isNotEmpty) {
              final product = state.products[1];
              return Column(
                children: [
                  CustomProductCard(product: product, size: size),
                ],
              );
            } else {
              return const Center(child: Text("No products found."));
            }
          },
        ),
      ),
    );
  }
}


