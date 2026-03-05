import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 17.5, right: 17.5),
          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 20, color: Color(0xFFF1F1F5));
      },
    );
  }
}
