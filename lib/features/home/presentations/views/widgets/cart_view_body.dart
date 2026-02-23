import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Column(children: [CartHeader()])),
      ],
    );
  }
}
