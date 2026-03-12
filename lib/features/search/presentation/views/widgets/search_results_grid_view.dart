import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruit_item.dart';

class SearchResultsGridView extends StatelessWidget {
  const SearchResultsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
          favoriteWidget: Container(),
        );
      },
    );
  }
}
