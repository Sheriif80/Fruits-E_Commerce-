import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/care_item_cubit/cart_item_cubit.dart';
import 'package:fruits_e_commerce_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text:
                "الدفع الان  :  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
            onPressed: () {
              if (BlocProvider.of<CartCubit>(
                context,
              ).cartEntity.cartItems.isNotEmpty) {
                GoRouter.of(context).pushNamed(
                  AppRoutes.checkoutView,
                  extra: context.read<CartCubit>().cartEntity,
                );
              } else {
                AppSnackbars.showInfo(
                  context,
                  message: " لا يوجد منتجات في السلة",
                );
              }
            },
          ),
        );
      },
    );
  }
}
