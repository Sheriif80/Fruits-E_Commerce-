import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruit_item.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/views/widgets/favorite_button.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 214,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
          favoriteWidget: const FavoriteButton(),
        );
      },
    );
  }
}
