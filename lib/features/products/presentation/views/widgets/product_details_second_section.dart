import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/custom_product_details_container.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsSecondSection extends StatelessWidget {
  const ProductDetailsSecondSection({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomProductDetailsContainer(
              title: s.general,
              subtitle: s.expiration,
              iconPath: Assets.imagesCalendar,
            ),
            const Spacer(),
            CustomProductDetailsContainer(
              title: productEntity.isOrganic ? "100%" : "0%",
              subtitle: productEntity.isOrganic ? s.organic : s.nonOrganic,
              iconPath: Assets.imagesLotus,
            ),
          ],
        ),
        const Gap(16),
        Row(
          children: [
            CustomProductDetailsContainer(
              title: s.calories(productEntity.numberOfCalories),
              subtitle: s.grams(productEntity.unitAmount),
              iconPath: Assets.imagesMatches,
            ),
            const Spacer(),

            GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).pushNamed(AppRoutes.reviewsView, extra: productEntity);
              },
              child: CustomProductDetailsContainer(
                title: productEntity.avgRating.toStringAsFixed(1),
                subtitle: s.reviewsCount(productEntity.numberOfRatings),
                iconPath: Assets.imagesFavourites,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
