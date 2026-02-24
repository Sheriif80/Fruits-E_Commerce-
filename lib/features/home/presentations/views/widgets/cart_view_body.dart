import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_header.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/widgets/cart_items_list.dart';
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
        const CartItemsList(cartItems: []),
        BlocProvider.of<CartCubit>(context).cartEntity.cartItems.isNotEmpty
            ? const SliverToBoxAdapter(
                child: Divider(height: 24, color: Color(0xFFF1F1F5)),
              )
            : const SliverToBoxAdapter(child: SizedBox()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text:
                  "الدفع الان  :  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
