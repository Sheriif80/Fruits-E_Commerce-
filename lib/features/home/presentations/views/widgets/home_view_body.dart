import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/best_seller_header.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/featured_list_view.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                Gap(16),
                CustomSearchTextField(),
                Gap(12),
                FeaturedListView(),
                Gap(12),
                BestSellerHeader(),
                Gap(8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
