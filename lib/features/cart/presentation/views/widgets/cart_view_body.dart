import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/cart_items_list.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/views/widgets/custom_cart_button.dart';
import 'package:gap/gap.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CartHeader(),
              const Gap(12),
              BlocProvider.of<CartCubit>(
                    context,
                  ).cartEntity.cartItems.isNotEmpty
                  ? const Divider(height: 24, color: Color(0xFFF1F1F5))
                  : const SizedBox(),
            ],
          ),
        ),
        CartItemsList(
          cartItems: context.watch<CartCubit>().cartEntity.cartItems,
        ),
        BlocProvider.of<CartCubit>(context).cartEntity.cartItems.isNotEmpty
            ? const SliverToBoxAdapter(
                child: Divider(height: 24, color: Color(0xFFF1F1F5)),
              )
            : const SliverToBoxAdapter(child: SizedBox()),
        const SliverToBoxAdapter(child: CustomCartButton()),
      ],
    );
  }
}
