import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/best_seller_grid_view_bloc_builder.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/products_view_result_header.dart';
import 'package:gap/gap.dart';

class ProdctsViewBody extends StatelessWidget {
  const ProdctsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                const Gap(16),
                const CustomSearchTextField(),
                const Gap(12),
                ProductsViewResultHeader(
                  productsLength: BlocProvider.of<ProductsCubit>(
                    context,
                  ).productsCount,
                ),
                const Gap(8),
              ],
            ),
          ),
          const BestSellerGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
