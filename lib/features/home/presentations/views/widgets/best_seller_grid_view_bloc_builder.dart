import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_e_commerce_app/core/helpers/get_dummy_product.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/best_seller_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerGridViewBlocBuilder extends StatelessWidget {
  const BestSellerGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return BestSellerGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return Skeletonizer.sliver(
            child: BestSellerGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
