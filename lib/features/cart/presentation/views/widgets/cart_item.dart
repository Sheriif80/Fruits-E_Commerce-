import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/care_item_cubit/cart_item_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: 73,
              height: 92,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColors.darkBackground
                    : const Color(0xFFF3F5F7),
              ),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CustomLoadingIndicator(width: 20, height: 20),
                ),
                errorBuilder: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),

                imageUrl: cartItemEntity.productEntity.imageURL!,
              ),
            ),
            const Gap(17),
            Expanded(
              child: Container(
                width: 73,
                height: 92,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartItemEntity.productEntity.name,
                            style: Appstyles.bold13,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<CartCubit>().removeProduct(
                                cartItemEntity.productEntity,
                              );
                            },
                            child: SvgPicture.asset(Assets.imagesTrash),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${cartItemEntity.calculateTotalWeight()} ${S.of(context).kg}",
                      style: Appstyles.bold13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const Gap(6),
                    CartItemActionButtons(cartItemEntity: cartItemEntity),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
