import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/views/widgets/favorite_products_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          if (state.products.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: LottieBuilder.asset(
                      'assets/lottie/empty ghost.json',
                    ),
                  ),
                  const Text(
                    'لا يوجد منتجات في المفضلة',
                    style: Appstyles.bold16,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Text(
                      "العودة الرئيسية",
                      style: Appstyles.bold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return FavoriteProductsGridView(products: state.products);
          }
        } else if (state is FavoritesFailure) {
          return Center(child: Text(state.message));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
