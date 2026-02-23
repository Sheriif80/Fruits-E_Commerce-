import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 17.5, right: 17.5),
          child: CartItem(),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 20, color: Color(0xFFF1F1F5));
      },
    );
  }
}
