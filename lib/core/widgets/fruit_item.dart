import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({
    super.key,
    required this.productEntity,
    required this.favoriteWidget,
  });
  final ProductEntity productEntity;
  final Widget favoriteWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.productDetailsView, extra: productEntity);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: context.isDarkMode
              ? AppColors.darkContainer
              : const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 12),
                AspectRatio(
                  aspectRatio: 114 / 80,
                  child: CachedNetworkImage(
                    imageUrl: productEntity.imageURL!,
                    placeholder: (context, url) => const Center(
                      child: CustomLoadingIndicator(width: 20, height: 20),
                    ),
                    errorBuilder: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                const Spacer(),
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: Appstyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price} جنية ',
                          style: Appstyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: Appstyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: Appstyles.semiBold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: Appstyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartCubit>(
                          context,
                        ).addProdcut(productEntity);
                      },
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(top: 0, right: 0, child: favoriteWidget),
          ],
        ),
      ),
    );
  }
}
