import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/best_seller_header.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/featured_list_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomHomeAppBar(),
                const Gap(16),
                CustomSearchTextField(
                  readOnly: true,
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRoutes.searchView);
                  },
                ),
                const Gap(12),
                const FeaturedListView(),
                const Gap(12),
                const BestSellerHeader(),
                const Gap(8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
