import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class ProductDetailsFirstSection extends StatelessWidget {
  const ProductDetailsFirstSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(productEntity.name, style: Appstyles.bold16),
            const Spacer(),
            /*
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            const Gap(12),
            const Text("2", style: Appstyles.bold16),
            const Gap(12),
            CircleAvatar(
              backgroundColor: const Color(0xFFF1F1F5),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.remove, color: AppColors.greyColor),
              ),
            ),
            */
          ],
        ),
        const Gap(8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${productEntity.price} جنية ',
                style: Appstyles.semiBold13.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              TextSpan(
                text: '/ الكيلو',
                style: Appstyles.semiBold13.copyWith(
                  color: AppColors.lightSecondaryColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        const Gap(5),
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFC529)),
            const Gap(10),
            Text(
              productEntity.avgRating.toString(),
              style: Appstyles.semiBold13,
            ),
            const Gap(10),
            Text(
              "(+${productEntity.numberOfRatings} )",
              style: Appstyles.regular13.copyWith(color: AppColors.greyColor),
            ),
            const Gap(10),
            Text(
              'المراجعه',
              style: Appstyles.bold13.copyWith(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        const Gap(8),
        Text(
          productEntity.description,
          style: Appstyles.regular13.copyWith(color: const Color(0xFF969899)),
        ),
      ],
    );
  }
}
