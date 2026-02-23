import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_item_action_buttons.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 73,
          height: 92,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
          child: CachedNetworkImage(
            placeholder: (context, url) => const Center(
              child: CustomLoadingIndicator(width: 20, height: 20),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),

            imageUrl: "",
          ),
        ),
        const Gap(17),
        Expanded(
          child: Container(
            width: 73,
            height: 92,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("بطيخ ", style: Appstyles.bold13),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(Assets.imagesTrash),
                      ),
                    ],
                  ),
                ),
                Text(
                  "3 كم ",
                  style: Appstyles.bold13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const Gap(6),
                const CartItemActionButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
