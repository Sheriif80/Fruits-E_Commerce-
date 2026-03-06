import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/product_circle_background.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/product_details_first_section.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/product_details_second_section.dart';
import 'package:gap/gap.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCircleBackground(imagePath: productEntity.imageURL!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsFirstSection(productEntity: productEntity),
                const Gap(16),
                ProductDetailsSecondSection(productEntity: productEntity),
                const Gap(24),
                CustomButton(
                  text: "اضافة الى السلة",
                  onPressed: () {
                    context.read<CartCubit>().addProdcut(productEntity);
                  },
                ),
                const Gap(24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
