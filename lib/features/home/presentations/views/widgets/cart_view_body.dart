import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_header.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_items_list.dart';
import 'package:gap/gap.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CartHeader(),
              Gap(12),
              Divider(height: 24, color: Color(0xFFF1F1F5)),
            ],
          ),
        ),
        const CartItemsList(cartItems: []),
        const SliverToBoxAdapter(
          child: Divider(height: 20, color: Color(0xFFF1F1F5)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(text: "الدفع الان", onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
