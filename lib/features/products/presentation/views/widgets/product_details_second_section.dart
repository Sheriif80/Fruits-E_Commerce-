import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/custom_product_details_container.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsSecondSection extends StatelessWidget {
  const ProductDetailsSecondSection({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            const CustomProductDetailsContainer(
              title: "عام",
              subtitle: "الصلاحية",
              iconPath: Assets.imagesCalendar,
            ),
            const Spacer(),
            CustomProductDetailsContainer(
              title: productEntity.isOrganic ? "100%" : "0%",
              subtitle: productEntity.isOrganic ? "اورجانيك" : "مش اورجانيك",
              iconPath: Assets.imagesLotus,
            ),
          ],
        ),
        const Gap(16),
        Row(
          children: [
            CustomProductDetailsContainer(
              title: "${productEntity.numberOfCalories} كالوري",
              subtitle: "${productEntity.unitAmount} جرام",
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
                title: productEntity.avgRating.toString(),
                subtitle: "المراجعات (${productEntity.numberOfRatings})",
                iconPath: Assets.imagesFavourites,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
